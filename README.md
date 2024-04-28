# aws-ec2-and-ebs-info-collection

**Prerequisites:**
If you want to launch any of these Bash files, you have to make sure 'aws_access_key_id' and 'aws_secret_access_key' are provided in '~/.aws/credentials'

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