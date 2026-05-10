import json
import logging
import urllib.parse

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handler(event, context):
    records = event.get("Records", [])
    if not records:
        logger.info(json.dumps({"event": "no_records"}))
        return {"ok": True, "count": 0}

    count = 0
    for rec in records:
        s3_info = rec.get("s3") or {}
        bucket = ((s3_info.get("bucket") or {}).get("name")) or ""
        key = ((s3_info.get("object") or {}).get("key")) or ""
        size = ((s3_info.get("object") or {}).get("size"))
        event_name = rec.get("eventName", "")

        if not bucket or not key:
            logger.warning(json.dumps({"event": "missing_bucket_or_key", "record": rec}))
            continue

        # S3 event keys are URL-encoded (spaces become '+')
        key = urllib.parse.unquote_plus(key)

        logger.info(json.dumps({
            "event": "object_uploaded",
            "bucket": bucket,
            "key": key,
            "size": size,
            "s3_event": event_name,
            "s3_uri": f"s3://{bucket}/{key}",
        }))
        count += 1

    return {"ok": True, "count": count}