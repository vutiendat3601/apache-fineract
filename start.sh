#!/bin/bash

source ./config/docker/env/postgresql-local.env

docker compose -f ./docker-compose-local.yml up -d \
&& ./gradlew :fineract-provider:createPGDB -PdbName=$FINERACT_TENANTS_DB_NAME \
&& ./gradlew :fineract-provider:createPGDB -PdbName=$FINERACT_TENANT_DEFAULT_DB_NAME \
&& FINERACT_HIKARI_USER_NAME=$POSTGRES_USER FINERACT_HIKARI_PASSWORD=$POSTGRES_PASSWORD ./gradlew devRun
