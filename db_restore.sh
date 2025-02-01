#!/bin/bash

set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for F in `ls $SCRIPT_DIR/docker/mysql/data/*.sql`;
do
    docker exec -i db sh -c 'mysql -ustaff -phappybeer bidb' <  $F
done

echo "🎉 Successfully restored.."