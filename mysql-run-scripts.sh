#!/usr/bin/env bash

docker compose exec mysql /bin/bash -c 'for f in /usr/local/bin/other-mysql-script/*.sh; do bash "$f"; done'