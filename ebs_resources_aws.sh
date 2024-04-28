#!/bin/bash

# 'regions' variable should be changed according to your specific case
regions=("ap-east-1" "us-west-2" "us-west-1" "us-east-2" "us-east-1" "sa-east-1" "eu-north-1" "eu-west-3" "eu-west-2" "eu-west-1" "eu-central-1" "ca-central-1" "ap-northeast-1" "ap-southeast-2" "ap-southeast-1" "ap-northeast-2" "ap-northeast-3" "ap-south-1")

total_volumes=0

for region in "${regions[@]}"; do
     echo -e "\nListing EBS volumes in region: $region..."
     volumes_count=$(aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId}' --output text | wc -l)
     aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId, State:State, Size:Size, Type:VolumeType, IOPS:Iops, Encrypted:Encrypted, SnapshotID:SnapshotId, InstanceID:Attachments[0].InstanceId, CreateTime:CreateTime}' --output table
     echo "Number of volumes in region $region: $volumes_count"
     total_volumes=$((total_volumes + volumes_count))
done

echo "Total number of volumes across all regions: $total_volumes"
