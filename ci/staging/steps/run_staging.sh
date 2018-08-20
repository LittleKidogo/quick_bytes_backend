#!/bin/sh

# lets copy over our compose incase of any changes
scp -o "StrictHostKeyChecking no" docker-compose.staging.yml ${1}@${2}:/${1}/qb_staging
ssh -o "StrictHostKeyChecking no" ${1}@${2} "cd qb_staging; docker-compose -f docker-compose.staging.yml pull; docker-compose -f docker-compose.staging.yml up -d --build web"
