# aws-ec2-and-ebs-info-collection

**Prerequisites:**
If you want to launch any of these Bash files, you have to make sure 'aws_access_key_id' and 'aws_secret_access_key' are provided in '~/.aws/credentials'

For all '.sh' files you need to provide 'execution' access level on your local, e.g. 
```
chmod u+x ec2_resources_aws.sh
```


**File 'aws_regions.sh':**
This file contains variable 'regions', which you need to modify according to AWS Regions list, applicable for your case. This variable is used in all scripts below.


**File 'ec2_resources_aws.sh':**

This script is designed to provide a summary of EC2 instances across multiple AWS regions. Here's a breakdown of its purpose and expected output:

Purpose:
To list EC2 instances in each specified AWS region.
To count the total number of EC2 instances across all specified regions.

Expected Output:
The script iterates through each AWS region specified in the regions array.
For each region, it lists the EC2 instances along with their attributes such as Instance ID, State, Instance Type, Public IP, Public DNS, Creation Time, and AMI (Amazon Machine Image).
It also displays the number of instances found in each region.
Finally, it prints the total number of instances across all specified regions.

The output will be organized in a tabular format, with columns representing different attributes of the EC2 instances. Each region's EC2 instances will be listed separately, and the total count of instances across all regions will be displayed at the end.


**File 'ebs_resources_aws.sh':**

This script is designed to provide a summary of EBS volumes across multiple AWS regions. Here's a breakdown of its purpose and expected output:

Purpose:
To list EBS volumes in each specified AWS region.
To count the total number of EBS volumes across all specified regions.

Expected Output:
The script iterates through each AWS region specified in the regions array.
For each region, it lists the EBS volumes along with their attributes such as Volume ID, State, Size, Volume Type, IOPS (Input/Output Operations Per Second), Encryption status, Snapshot ID, Instance ID to which the volume is attached (if any), and Creation Time.
It also displays the number of volumes found in each region.
Finally, it prints the total number of volumes across all specified regions.

Similar to the EC2 script, the output will be organized in a tabular format, with columns representing different attributes of the EBS volumes. Each region's volumes will be listed separately, and the total count of volumes across all regions will be displayed at the end.


**File 'ec2_deletion_state_stopped.sh':**

Purpose:
To automatically terminate EC2 instances and delete attached EBS volumes that are in the "Stopped" state within all specified AWS regions.

Expected Output:
The script iterates through each AWS region specified in the regions array.
For each region, it lists the EC2 instances that are in the "Stopped" state and terminates them.
It also lists the EBS volumes that are attached to the terminated instances and deletes them.
The script displays the number of instances terminated and volumes deleted in each region.
Finally, it prints the total number of instances terminated and volumes deleted across all specified regions.


**File 'ec2_stop_running.sh':**

Purpose:
This script is designed to stop all running EC2 instances across multiple AWS regions. It iterates through each specified AWS region and identifies all EC2 instances in the "running" state. Then, it stops each running instance while ensuring that no instances are deleted.

Expected Output:
The script displays a summary of the instances being stopped, including their Instance ID, current state, and the region in which they are located. Additionally, it provides a count of the total number of running instances that were stopped across all regions.

With this script, you can easily manage and stop running EC2 instances across multiple AWS regions, helping to optimize costs and manage resources efficiently.


**File 'ebs_deletion.sh'**

Purpose:
This script is designed to delete all EBS volumes within multiple AWS regions. It iterates through each specified region, lists all EBS volumes, and deletes them one by one.

Expected Output:

The script displays the regions where EBS volumes are being deleted.
For each region, it lists the volumes that are deleted and prints the count of deleted volumes.
At the end, it provides the total count of volumes deleted across all regions.