#!/usr/bin/env python3
"""Submit URLs from a text file to IndexNow.

Usage:
  python script/indexnow.py urls.txt
  python script/indexnow.py --config path/to/config.json urls.txt
  python script/indexnow.py -y urls.txt
"""

from __future__ import annotations

import argparse
import json
import sys
import urllib.error
import urllib.request
from pathlib import Path
from typing import Dict, List
from urllib.parse import urlparse

if sys.platform == "win32":
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(encoding="utf-8", errors="replace")

TIMEOUT = 60
MAX_RETRIES = 2
BATCH_SIZE = 100


def default_config_path() -> Path:
    return Path(__file__).resolve().parent / "indexnow.config.json"


def load_config(config_path: Path) -> Dict:
    try:
        with config_path.open("r", encoding="utf-8") as handle:
            raw = json.load(handle)
    except FileNotFoundError:
        print(f"配置文件不存在: {config_path}")
        sys.exit(1)
    except json.JSONDecodeError as exc:
        print(f"配置文件格式错误: {exc}")
        sys.exit(1)

    host = raw.get("host") or raw.get("domain")
    key = raw.get("key") or raw.get("api_key")
    endpoint = raw.get("api_endpoint") or raw.get("api_url")
    if not host or not key or not endpoint:
        print("配置需要 host、key、api_endpoint")
        sys.exit(1)

    return {
        "host": host,
        "key": key,
        "key_location": raw.get("key_location"),
        "api_endpoint": endpoint,
    }


def load_urls(url_file: Path) -> List[str]:
    try:
        lines = url_file.read_text(encoding="utf-8").splitlines()
    except FileNotFoundError:
        print(f"URL 文件不存在: {url_file}")
        sys.exit(1)

    return [line.strip() for line in lines if line.strip() and not line.strip().startswith("#")]


def validate_urls(urls: List[str], host: str) -> List[str]:
    valid: List[str] = []
    for url in urls:
        parsed = urlparse(url)
        if parsed.scheme in {"http", "https"} and parsed.hostname == host and url not in valid:
            valid.append(url)
        else:
            print(f"跳过无效 URL (不属于 {host}): {url}")
    return valid


def post_urls(config: Dict, urls: List[str]) -> tuple[int, str]:
    payload = {
        "host": config["host"],
        "key": config["key"],
        "urlList": urls,
    }
    if config.get("key_location"):
        payload["keyLocation"] = config["key_location"]

    data = json.dumps(payload).encode("utf-8")
    request = urllib.request.Request(
        config["api_endpoint"],
        data=data,
        headers={"Content-Type": "application/json; charset=utf-8"},
        method="POST",
    )

    last_error: Exception | None = None
    for attempt in range(1, MAX_RETRIES + 1):
        try:
            print(f"  尝试 {config['api_endpoint']} (第 {attempt}/{MAX_RETRIES} 次)...")
            with urllib.request.urlopen(request, timeout=TIMEOUT) as response:
                body = response.read().decode("utf-8", errors="replace")
                return response.status, body
        except urllib.error.HTTPError as exc:
            body = exc.read().decode("utf-8", errors="replace")
            return exc.code, body
        except (urllib.error.URLError, TimeoutError) as exc:
            last_error = exc
            print(f"    请求失败: {exc}")

    raise last_error or urllib.error.URLError("IndexNow 请求失败")


def submit(config: Dict, urls: List[str]) -> bool:
    print(f"域名: {config['host']}")
    print(f"准备提交 {len(urls)} 个 URL")
    print()

    success_count = 0
    fail_count = 0
    batches = [urls[index : index + BATCH_SIZE] for index in range(0, len(urls), BATCH_SIZE)]

    for batch_num, batch_urls in enumerate(batches, 1):
        print(f"提交第 {batch_num}/{len(batches)} 批 ({len(batch_urls)} 个 URL)...")
        try:
            status, body = post_urls(config, batch_urls)
        except urllib.error.URLError as exc:
            print(f"第 {batch_num} 批请求失败: {exc}")
            fail_count += len(batch_urls)
            print()
            continue

        if status in (200, 202):
            print(f"第 {batch_num} 批提交成功 (状态码: {status})")
            success_count += len(batch_urls)
        else:
            messages = {
                400: "请求格式无效",
                403: "API 密钥无效或未找到密钥文件",
                422: "URL 不属于指定域名或密钥格式不匹配",
                429: "请求频率过高，请稍后再试",
            }
            print(f"第 {batch_num} 批提交失败: {messages.get(status, f'HTTP {status}')}")
            if body:
                print(f"  响应内容: {body}")
            fail_count += len(batch_urls)
        print()

    print(f"成功: {success_count} 个 URL")
    print(f"失败: {fail_count} 个 URL")
    return fail_count == 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Submit URLs from a text file to IndexNow.")
    parser.add_argument("url_file", type=Path, help="每行一个 URL 的文本文件")
    parser.add_argument(
        "-c",
        "--config",
        type=Path,
        default=default_config_path(),
        help="配置文件路径 (默认: script/indexnow.config.json)",
    )
    parser.add_argument("-y", "--yes", action="store_true", help="跳过确认，直接提交")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    config = load_config(args.config.resolve())
    urls = validate_urls(load_urls(args.url_file), config["host"])
    if not urls:
        print("没有有效的 URL 可提交")
        sys.exit(1)

    print(f"找到 {len(urls)} 个有效 URL:")
    for index, url in enumerate(urls[:10], 1):
        print(f"  {index}. {url}")
    if len(urls) > 10:
        print(f"  ... 还有 {len(urls) - 10} 个 URL")
    print()

    if len(urls) > 5 and not args.yes:
        try:
            confirm = input("是否继续提交? (y/N): ").strip().lower()
        except (KeyboardInterrupt, EOFError):
            print("\n用户取消操作")
            sys.exit(0)
        if confirm not in {"y", "yes"}:
            print("用户取消操作")
            sys.exit(0)
        print()

    if submit(config, urls):
        print("提交完成。请在 Bing Webmaster Tools 中查看接收状态。")
        return
    sys.exit(1)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n用户中断操作")
        sys.exit(1)
