#!/bin/bash

# 'regions' list from variable 'aws_regions.sh'
source aws_regions.sh

total_instances=0
total_volumes=0

for region in "${regions[@]}"; do
     echo -e "\nListing Instances in region: $region..."
     instances=$(aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[?State.Name==`stopped`].[InstanceId]' --output text)
     instances_count=$(echo "$instances" | wc -l)
     total_instances=$((total_instances + instances_count))
     
     if [ ! -z "$instances" ]; then
         echo "Terminating instances in region $region..."
         aws ec2 terminate-instances --instance-ids $instances --region $region
     fi

     volumes=$(aws ec2 describe-volumes --region $region --query 'Volumes[?Attachments[?State==`stopped`]].VolumeId' --output text)
     volumes_count=$(echo "$volumes" | wc -l)
     total_volumes=$((total_volumes + volumes_count))

     if [ ! -z "$volumes" ]; then
         echo "Deleting volumes in region $region..."
         aws ec2 delete-volume --volume-ids $volumes --region $region
     fi

     echo "Number of instances terminated in region $region: $instances_count"
     echo "Number of volumes deleted in region $region: $volumes_count"
done

echo "Total number of instances terminated across all regions: $total_instances"
echo "Total number of volumes deleted across all regions: $total_volumes"
