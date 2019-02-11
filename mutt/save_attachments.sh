#!/usr/bin/env bash
tilix -e ranger --choosefile=%s
cat > $"`cat %s`"
