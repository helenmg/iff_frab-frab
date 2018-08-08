#!/bin/bash
set -e

echo "> Prepping app"

echo "> bin/setup"
./bin/setup

echo "> Starting server"
rm -f tmp/pids/server.pid
bundle exec rails server -b 0.0.0.0
