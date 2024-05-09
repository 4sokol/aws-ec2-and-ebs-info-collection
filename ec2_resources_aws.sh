#!/bin/bash

# 'regions' list from variable 'aws_regions.sh'
source aws_regions.sh

total_instances=0

for region in "${regions[@]}"; do
     echo -e "\nListing Instances in region: $region..."
     instances_count=$(aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[*].{ID:InstanceId}' --output text | wc -l)
     aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[*].{ID:InstanceId, State:State.Name, Type:InstanceType, PublicIP:PublicIpAddress, DNSName:PublicDnsName, CreationTime:LaunchTime, AMI:ImageId}' --output table
     echo "Number of instances in region $region: $instances_count"
     total_instances=$((total_instances + instances_count))
done

echo "Total number of instances across all regions: $total_instances"
