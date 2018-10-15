#!/usr/bin/env bash

public_key="$(ssh-add -L | awk '{ print $1, $2 ; exit }')"
echo "{\"public_key\": \"${public_key}\"}"

