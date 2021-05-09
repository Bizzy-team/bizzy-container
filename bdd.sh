#!/usr/bin/env bash

getBackup() {
    echo "Retrieving last backup."
    docker exec --env-file='./.env' -i db bash -c 'mongodump --archive="./tmp/dump-bizzy.gz" --gzip --db bizzy-dev --uri "$DB_URL" && mongorestore --gzip --nsInclude="bizzy-dev.*" --archive="./tmp/dump-bizzy-dev.gz"'
}

getBackup