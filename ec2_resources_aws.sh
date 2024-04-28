#!/bin/bash

# 'regions' variable should be changed according to your specific case
regions=("ap-east-1" "us-west-2" "us-west-1" "us-east-2" "us-east-1" "sa-east-1" "eu-north-1" "eu-west-3" "eu-west-2" "eu-west-1" "eu-central-1" "ca-central-1" "ap-northeast-1" "ap-southeast-2" "ap-southeast-1" "ap-northeast-2" "ap-northeast-3" "ap-south-1")

total_instances=0

for region in "${regions[@]}"; do
     echo -e "\nListing Instances in region: $region..."
     instances_count=$(aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[*].{ID:InstanceId}' --output text | wc -l)
     aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[*].{ID:InstanceId, State:State.Name, Type:InstanceType, PublicIP:PublicIpAddress, DNSName:PublicDnsName, CreationTime:LaunchTime, AMI:ImageId}' --output table
     echo "Number of instances in region $region: $instances_count"
     total_instances=$((total_instances + instances_count))
done

echo "Total number of instances across all regions: $total_instances"
