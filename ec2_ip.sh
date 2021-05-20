#!/usr/bin/env bash

echo "enter tag name of EC2"
read TAGNAME

echo -e "[all]\n" > inventory
aws ec2 describe-instances \
--filters "Name=tag:Name,Values=$TAGNAME" \
--query 'Reservations[*].Instances[*].PublicIpAddress' \
--output text >> inventory
cat inventory
