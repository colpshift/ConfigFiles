#!/usr/bin/env bash
urxvtc -e ranger --choosefile=%s
cat > $"`cat %s`"
