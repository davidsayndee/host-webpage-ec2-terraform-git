Provission EC2 Instance in a private VPC and deploy a webpage in it.

I will create the following resources with terraform
####################################################

1. One VPC
2. One subnet. I will make it public by using an IGW
3. Internet gateway
4. Routing Table for routing to our vpc
5. Route
6. Route Table association to associate route table with the subnet
7. EC2 instance where I deploy the webpage (this will utilize a user data script that automatically install git and apache. Apache is our webserver here to host our webpage. Git will clone our webpage)
8. Security group (firewall to control inbound and outbound traffic. I open ) 