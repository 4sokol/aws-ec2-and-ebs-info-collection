#!/bin/bash

# 'regions' list from variable 'aws_regions.sh'
source aws_regions.sh

total_stopped_instances=0

# Iterate over each AWS region
for region in "${regions[@]}"; do
    echo -e "\nStopping running EC2 instances in region: $region..."

    # Get a list of running instance IDs in the region
    running_instance_ids=$(aws ec2 describe-instances --region $region --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].InstanceId' --output text)

    # If there are no running instances in the region, continue to the next region
    if [ -z "$running_instance_ids" ]; then
        echo "No running instances found in region $region."
        continue
    fi

    # Stop each running instance
    for instance_id in $running_instance_ids; do
        aws ec2 stop-instances --region $region --instance-ids $instance_id >/dev/null
        echo "Stopped instance: $instance_id"
    done

    # Count the number of stopped instances in the region
    stopped_instances_count=$(echo "$running_instance_ids" | wc -w)
    total_stopped_instances=$((total_stopped_instances + stopped_instances_count))
    echo "Number of stopped instances in region $region: $stopped_instances_count"
done

echo -e "\nTotal number of stopped instances across all regions: $total_stopped_instances"
