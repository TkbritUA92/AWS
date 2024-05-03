Step 1
Creating a VPC:
Use the AWS Management Console to create a new VPC.
Configure the VPC with an appropriate CIDR block.
Enable DNS hostnames for the VPC.

Step 2
Creating Subnets:
Create two subnets within the VPC, each in a different availability zone.
Assign CIDR blocks to the subnets.

Step 3
Creating an Internet Gateway (IGW):
Create an internet gateway and attach it to the VPC.
This will allow instances within the VPC to communicate with the internet.

Step 4
Creating Route Tables:
Create a custom route table for the VPC.
Add a route to the internet gateway in the route table.

Step 5
Launching EC2 Instances:
Launch two EC2 instances, one in each subnet.
Choose an appropriate instance type and Amazon Machine Image (AMI).
Configure security groups to allow necessary inbound and outbound traffic.
Assign Elastic IP addresses to the instances if required.

Step 6
Connecting EC2 Instances:
SSH into one of the EC2 instances from the other instance using their private IP addresses.
Test connectivity between the instances by transferring files or pinging each other.
Ensure that both instances can access the internet.

Step 7
Documentation and Reporting:
Document the steps followed to set up the VPC, subnets, EC2 instances, and connectivity between them.
Include screenshots where necessary.
Provide any observations or challenges faced during the process.
Submit the documentation as per the instructor's guidelines.
