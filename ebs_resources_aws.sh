#!/bin/bash

# 'regions' list from variable 'aws_regions.sh'
source aws_regions.sh

total_volumes=0

for region in "${regions[@]}"; do
     echo -e "\nListing EBS volumes in region: $region..."
     volumes_count=$(aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId}' --output text | wc -l)
     aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId, State:State, Size:Size, Type:VolumeType, IOPS:Iops, Encrypted:Encrypted, SnapshotID:SnapshotId, InstanceID:Attachments[0].InstanceId, CreateTime:CreateTime}' --output table
     echo "Number of volumes in region $region: $volumes_count"
     total_volumes=$((total_volumes + volumes_count))
done

echo "Total number of volumes across all regions: $total_volumes"
