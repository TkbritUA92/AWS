###Step 1
###Create VPC:

aws ec2 create-vpc --cidr-block 10.0.0.0/16

###Replace 10.0.0.0/16 with the desired CIDR block for your VPC.

###Step 2 
###Tag the VPC:

aws ec2 create-tags --resources your-vpc-id --tags Key=Name,Value=YourVPCName
###Replace your-vpc-id with the ID of the VPC created in step 1, and specify a name for your VPC.

###Step 3
###Enable DNS Hostnames for the VPC:

aws ec2 modify-vpc-attribute --vpc-id your-vpc-id --enable-dns-support "{\"Value\":true}"
aws ec2 modify-vpc-attribute --vpc-id your-vpc-id --enable-dns-hostnames "{\"Value\":true}"
###Replace your-vpc-id with the ID of the VPC created in step 1.

###Step 4
###Create Subnets:

aws ec2 create-subnet --vpc-id your-vpc-id --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
aws ec2 create-subnet --vpc-id your-vpc-id --cidr-block 10.0.2.0 /24 --availability-zone us-east-1b
###Replace your-vpc-id with the ID of the VPC created in step 1. Define CIDR blocks for each subnet and specify the availability zones accordingly.

###Step 5
###Create an Internet Gateway (IGW):

aws ec2 create-internet-gateway
###Note the ID of the internet gateway created.

###Step 6
###Attach the Internet Gateway to the VPC:

aws ec2 attach-internet-gateway --vpc-id your-vpc-id --internet-gateway-id your-igw-id
###Replace your-vpc-id with the ID of the VPC created in step 1, and your-igw-id with the ID of the internet gateway created in step 5.

###Step 7
###Create a Route Table:
aws ec2 create-route-table --vpc-id your-vpc-id

###Replace your-vpc-id with the ID of the VPC created in step 1.

###Step 8
###Create Route Entries:

aws ec2 create-route --route-table-id your-route-table-id --destination-cidr-block 0.0.0.0/0 --gateway-id your-igw-id

###Replace your-route-table-id with the ID of the route table created in step 7, and your-igw-id with the ID of the internet gateway created in step 5.

###Step 9
###Associate Subnets with the Route Table:

aws ec2 associate-route-table --subnet-id your-subnet1-id --route-table-id your-route-table-id
aws ec2 associate-route-table --subnet-id your-subnet2-id --route-table-id your-route-table-id

###Replace your-subnet1-id and your-subnet2-id with the IDs of the subnets created in step 4, and your-route-table-id with the ID of the route table created in step 7.
###These commands will create a basic VPC spanning two availability zones with subnets and internet connectivity using the AWS CLI. Adjust the parameters according to your specific requirements.

