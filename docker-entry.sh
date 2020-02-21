#!/bin/bash
until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable: sleeping..."
  sleep 1
done

if [ "${1}" = "setup" ]; then
  echo "Creating and migrating development database..."
  mix do ecto.drop, ecto.create
  psql -h db -U postgres guildship_dev -c "CREATE EXTENSION pgcrypto"
  mix do ecto.migrate, seed
elif [ "${1}" = "test" ]; then
  echo "Running tests..."
  MIX_ENV=test mix do ecto.drop, ecto.create
  psql -h db -U postgres guildship_test -c "CREATE EXTENSION pgcrypto"
  MIX_ENV=test mix do ecto.migrate, seed
  mix test "${@:2}"
elif [ "${1}" = "test.watch" ]; then
  echo "Watching tests..."
  MIX_ENV=test mix do ecto.drop, ecto.create
  psql -h db -U postgres guildship_test -c "CREATE EXTENSION pgcrypto"
  MIX_ENV=test mix do ecto.migrate, seed
  mix test.watch "${@:2}"
elif [ ! -z ${1} ]; then
  mix "$@"
else
  echo "Starting Phoenix server..."
  mix phx.server
fi
