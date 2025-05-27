# Host Webpage on AWS EC2 with Terraform

This project uses **Terraform** to provision an AWS EC2 instance that automatically hosts a simple HTML webpage. It's a practical Infrastructure as Code (IaC) example showing automation, cloud provisioning, and server configuration — demostrating my understanding of DevOps, or cloud engineering.

---

## 🚀 Project Overview

This Terraform configuration does the following:

- Provisions an EC2 instance in AWS.
- Creates a security group allowing HTTP and SSH access.
- Installs Apache HTTP server on the instance.
- Serves a basic webpage using user data.
- Outputs the public IP and URL of the hosted page.

---

## 📁 Project Structure

```bash
.
├── main.tf          # Terraform resources (EC2, Security Group, User Data)
├── variables.tf     # Input variables (instance type, key pair, region, etc.)
├── outputs.tf       # Output values (public IP, instance URL)
├── provider.tf      # AWS provider configuration
├── terraform.tfvars # Variable values (you can rename or create this file)
└── README.md        # Project documentation
