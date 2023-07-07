#!/bin/bash

TOKEN=$1

if [ -n "$TOKEN" ]; then
  RATE_LIMIT=$(curl -s -H "Authorization: token $TOKEN" https://api.github.com/rate_limit)
else
  RATE_LIMIT=$(curl -s https://api.github.com/rate_limit)
fi

LIMIT=$(echo $RATE_LIMIT | jq .rate.limit)
REMAINING=$(echo $RATE_LIMIT | jq .rate.remaining)
RESET=$(echo $RATE_LIMIT | jq .rate.reset)
USED=$(echo $RATE_LIMIT | jq .rate.used)
RESOURCE=$(echo $RATE_LIMIT | jq .rate.resource)
RESET_TIME=$(date -d @$RESET -u)
NOW=$(date +%s)
TIME_REMAINING_SECONDS=$(($RESET-$NOW))
TIME_REMAINING_MINUTES=$(($TIME_REMAINING_SECONDS / 60))
echo "Rate limit information:"
echo "Resource: $RESOURCE"
echo "Total limit: $LIMIT"
echo "Remaining: $REMAINING"
echo "Used: $USED"
echo "The rate limit will reset at $RESET_TIME UTC"
echo "Time remaining until reset: $TIME_REMAINING_SECONDS seconds ($TIME_REMAINING_MINUTES minutes)"
echo "remaining=$REMAINING"
echo "remaining=$REMAINING" >> $GITHUB_OUTPUT
echo "remaining=$GITHUB_OUTPUT"
