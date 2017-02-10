#!/bin/bash

usage() { echo "Usage: $0 [-e <dev|test|prod>]"; exit 1; }

checkdbconn() {
  counter=0
  concheck=$(ruby testdb.rb)
  if [ "${concheck} != 100 && "${concheck} != 0 ]; then
    exit 1
  fi
  while [ "$(concheck)" == 100 ]; do
    echo "Database is not available, waiting..."
    $counter = $counter + 1
    if [ $counter -gt 2 ]; then
      echo "Database is not available!"
      exit 1
    fi
    sleep 5
    $concheck=$(ruby testdb.rb)
  done
}

while getopts ":e:" opt; do
  case "${opt}" in
    e)
      e=${OPTARG}
      if [ -z "${e}" ]; then
        e=dev
      fi
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))


# Execute operations based on environment
case $e in
  dev)
    # RAILS_ENV=development
    # Create and migrate the database
    export RAILS_ENV=development
    checkdbconn

    rake db:create
    rake db:migrate

    rails s puma -b 0.0.0.0
    ;;

  test)
    # RAILS_ENV=test
    # Create and migrate the database
    # Run rake test
    export RAILS_ENV=test
    checkdbconn

    rake db:create
    rake db:migrate

    rake test
    ;;

  prod)
    # RAILS_ENV=prod
    # Create and migrate the database
    # Seed data
    # Remove and recompile assets
    export RAILS_ENV=production
    checkdbconn

    rake db:create
    rake db:migrate
    rake assets:precompile

    rails s puma -b 0.0.0.0
    ;;

  *)
    usage
    ;;
esac

exit $?
