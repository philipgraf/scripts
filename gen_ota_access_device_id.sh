#!/bin/bash

set -e

function gen_uuid {
        uuidgen | tr -d "-" | awk '{print tolower($0)}'
}

echo -n "$( gen_uuid );$( gen_uuid )" | base64
