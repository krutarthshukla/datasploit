#!/bin/bash
cd /
cd datasploit/core
C_FORCE_ROOT=root celery -A core worker -l info --concurrency 20 &
