#!/bin/bash

# 'regions' list from variable 'aws_regions.sh'
source aws_regions.sh

total_volumes=0

for region in "${regions[@]}"; do
    echo -e "\nDeleting EBS volumes in region: $region..."
    volumes=$(aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId}' --output text)
    for volume in $volumes; do
        aws ec2 delete-volume --region $region --volume-id $volume
    done
    volumes_count=$(echo "$volumes" | wc -w)
    echo "Number of volumes deleted in region $region: $volumes_count"
    total_volumes=$((total_volumes + volumes_count))
done

echo "Total number of volumes deleted across all regions: $total_volumes"
