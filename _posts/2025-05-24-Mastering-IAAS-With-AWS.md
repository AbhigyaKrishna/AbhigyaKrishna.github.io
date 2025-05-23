---
layout: post
title: Mastering IAAS with AWS
description: A comprehensive guide to building robust cloud infrastructure
date: 2025-05-24 01:32 +0530
image: '/images/iaas.jpg'
tags: [Cloud, DevOps, AWS, Infrastructure]
---

# Mastering Infrastructure as a Service with AWS

> "The cloud is not about how you build infrastructure. It's about how you use the flexibility it provides."

In today's technology-driven world, cloud computing has transformed from a buzzword into the foundation of modern IT infrastructure. But beneath the marketing hype lies a powerful concept that is revolutionizing how businesses operate and scale.

## The Power of Cloud Computing

Cloud computing provides on-demand access to computing resources—everything from applications to data centers—over the internet on a pay-for-use basis. This shift from capital expenditure to operational expenditure has made enterprise-grade technology accessible to businesses of all sizes, democratizing access to advanced infrastructure.

### Understanding IaaS: The Foundation of Cloud Architecture

Among the three main service models of cloud computing (SaaS, PaaS, and IaaS), **Infrastructure as a Service (IaaS)** represents the most fundamental layer. IaaS provides the essential building blocks for cloud IT:

| Resource Type | What You Get | Traditional Equivalent |
|---------------|-------------|------------------------|
| **Compute** | Virtual machines with configurable CPU and RAM | Physical servers in a data center |
| **Storage** | Block, object, and file storage options | SANs, NAS devices, and disk arrays |
| **Networking** | Virtual networks, subnets, IP addresses, load balancers | Routers, switches, firewalls, and load balancers |
| **Security** | Identity management, access control, encryption | Physical security, firewalls, and network policies |

IaaS offers the highest level of flexibility and management control over your IT resources. Rather than purchasing hardware outright, you rent exactly what you need, when you need it, and scale up or down as demand changes—all while maintaining complete control over the configuration and management of your infrastructure.

### AWS: The Pioneer of Cloud IaaS

When discussing IaaS providers, **Amazon Web Services (AWS)** stands out as both a pioneer and industry leader. With its launch in 2006, AWS fundamentally changed how businesses approach IT infrastructure, offering:

- Over 200 fully featured services accessible globally
- Presence in 27 geographic regions with 87 availability zones
- Comprehensive security capabilities and compliance certifications
- Unmatched scale and reliability for businesses of all sizes

In this comprehensive guide, we'll explore how to leverage AWS's powerful IaaS offerings to build robust, scalable, and cost-effective cloud solutions that can transform your infrastructure capabilities.

## What We'll Cover

| Section | Key Learning |
|---------|-------------|
| **Deploying Web Applications** | Building scalable infrastructure with EC2, ALB, and ASG |
| **Path-Based Routing** | Directing traffic to different services using ALB rules |
| **Advanced Networking** | Implementing private/public subnets with secure bastion access |
| **Domain Configuration** | Setting up end-to-end routing for multi-port applications |
| **Cross-Account VPC Peering** | Establishing secure connectivity between AWS accounts |
| **EBS & AMI Management** | Creating snapshots and images for data persistence |
| **IAM Policy Creation** | Implementing fine-grained access control for EC2 |
| **S3 Bucket Operations** | Managing storage using AWS CLI |

## Deploying a Web Application on AWS

> ### What You'll Learn
> - Setting up EC2 instances and installing web server software
> - Creating an Application Load Balancer for traffic distribution
> - Configuring Auto Scaling Groups to automatically adjust capacity
> - Testing and verifying scaling behavior under load

In this section, we'll build a resilient and scalable web application infrastructure on AWS by combining multiple IaaS components to create a robust architecture that automatically adjusts to traffic demands.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **EC2 (Elastic Compute Cloud)** | Virtual servers in the cloud that provide resizable compute capacity |
| **ALB (Application Load Balancer)** | Distributes incoming application traffic across multiple targets |
| **ASG (Auto Scaling Group)** | Maintains application availability by automatically adding or removing EC2 instances |
| **AMI (Amazon Machine Image)** | Pre-configured templates used for EC2 instance creation |
| **Launch Template** | Contains configuration information to launch instances in an ASG |

### Task 1: Deploy Web Application on EC2 Instances

**Steps:**

1. **Launch EC2 Instances**:
   * Navigate to EC2 dashboard > Launch Instances
   * Select an AMI (e.g., Ubuntu Server 22.04 LTS)
   * Choose instance type (e.g., `t2.micro`)
   * Configure network settings (VPC, subnets)
   * Add security groups (allow HTTP/SSH)
   * Launch at least two instances with a key pair

2. **Connect and Configure Instances**:
   ```bash
   ssh -i "your-key.pem" ubuntu@instance-public-ip
   sudo apt update
   sudo apt install -y nginx
   sudo systemctl start nginx
   sudo systemctl enable nginx
   ```

3. **Deploy Application**:
   ```bash
   sudo tee /var/www/html/index.html > /dev/null << EOF
   <!DOCTYPE html>
   <html>
   <head>
       <title>AWS Web Application</title>
       <style>
           body { font-family: Arial, sans-serif; margin: 40px; line-height: 1.6; }
           h1 { color: #232f3e; }
           .container { max-width: 800px; margin: 0 auto; }
           .aws-color { color: #ff9900; }
       </style>
   </head>
   <body>
       <div class="container">
           <h1>Hello from <span class="aws-color">AWS</span>!</h1>
           <h3>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</h3>
           <p>This page is being served from an Amazon EC2 instance.</p>
       </div>
   </body>
   </html>
   EOF
   ```

4. **Verify Deployment**:
   * Access each instance's public IP/DNS in a browser
   * Confirm the application is running correctly

### Task 2: Set Up an Application Load Balancer (ALB)

**Steps:**

1. **Create Target Group**:
   * EC2 dashboard > Target Groups > Create target group
   * Name: `web-target-group`
   * Protocol: HTTP, Port: 80
   * VPC: Select your VPC
   * Health check path: `/`
   * Register your EC2 instances
   * Create target group

2. **Create Load Balancer**:
   * EC2 dashboard > Load Balancers > Create load balancer
   * Choose "Application Load Balancer"
   * Name: `web-application-lb`
   * Scheme: Internet-facing
   * Select at least two Availability Zones
   * Security Groups: Allow HTTP (80)
   * Listener: HTTP:80, forward to your target group
   * Create ALB

3. **Verify Load Balancer**:
   * Wait for ALB to become active (~2-5 minutes)
   * Access the ALB's DNS name in a browser
   * Reload multiple times to see requests distributed

### Task 3: Configure Auto Scaling Group (ASG)

**Steps:**

1. **Create Launch Template**:
   * EC2 dashboard > Launch Templates > Create launch template
   * Name: `web-launch-template`
   * Select same AMI, instance type as your instances
   * Configure security groups for HTTP/SSH
   * Add user data script to automate setup:
   
   ```bash
   #!/bin/bash
   sudo apt update
   sudo apt install -y nginx
   sudo systemctl start nginx
   sudo systemctl enable nginx
   
   # Create custom index page
   sudo tee /var/www/html/index.html > /dev/null << EOF
   <!DOCTYPE html>
   <html>
   <head>
       <title>AWS Web Application</title>
       <style>
           body { font-family: Arial, sans-serif; margin: 40px; line-height: 1.6; }
           h1 { color: #232f3e; }
           .container { max-width: 800px; margin: 0 auto; }
           .aws-color { color: #ff9900; }
       </style>
   </head>
   <body>
       <div class="container">
           <h1>Hello from <span class="aws-color">AWS</span>!</h1>
           <h3>Instance ID: \$(curl -s http://169.254.169.254/latest/meta-data/instance-id)</h3>
           <p>This page is being served from an Amazon EC2 instance.</p>
       </div>
   </body>
   </html>
   EOF
   ```

2. **Create Auto Scaling Group**:
   * EC2 dashboard > Auto Scaling Groups > Create Auto Scaling group
   * Name: `web-asg`
   * Select your launch template
   * VPC and subnet selection: Choose your VPC and multiple subnets
   * Load balancing: Attach to your target group
   * Group size: Desired (2), Minimum (2), Maximum (6)
   * Scaling policies: Target tracking, CPU utilization at 70%
   * Create ASG

3. **Verify ASG Configuration**:
   * Check that initial instances are launched
   * Confirm they register with the load balancer
   * Verify health checks are passing

### Task 4: Test Scaling Behavior

**Steps:**

1. **Generate Load**:
   * Connect to a test instance
   * Install stress-testing tools:
   ```bash
   sudo apt update
   sudo apt install -y apache2-utils stress
   ```
   * Use Apache Bench to generate load:
   ```bash
   ab -n 10000 -c 100 http://your-alb-dns-name/
   ```

2. **Monitor Scaling Activities**:
   * Watch ASG activity history in the console
   * Observe CloudWatch metrics for CPU utilization
   * Notice new instances being launched as load increases

3. **Verify Application Availability**:
   * Continue accessing the application through ALB
   * Confirm it remains responsive during scaling

4. **Observe Scale-In**:
   * Stop the load-generating tool
   * Watch as ASG reduces the number of instances
   * Verify instances are terminated according to policy

This robust architecture ensures your application remains available even during traffic spikes while optimizing costs by automatically reducing capacity during periods of lower demand.

> **Pro Tip**: Always create EC2 instances across multiple Availability Zones to enhance fault tolerance. If one AZ experiences issues, your application will continue to run from instances in other AZs.

## Path-based Routing in AWS Application Load Balancer

> ### What You'll Learn
> - Creating and configuring target groups for different applications
> - Implementing path-based routing rules in an ALB
> - Testing and verifying routing configuration  
> - Managing multiple services behind a single load balancer

Path-based routing enables you to direct traffic to different backend services based on the URL path of the request. This is particularly useful for hosting microservices or multiple application components behind a single load balancer.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **Listener** | Process that checks for connection requests using a specified protocol and port |
| **Target Group** | Group of resources (EC2 instances, containers, IP addresses) that receive traffic |
| **Routing Rules** | Conditions that determine how requests are forwarded to target groups |
| **Path Pattern** | URL pattern used to match and route requests to specific target groups |
| **Rule Priority** | Determines the order in which rules are evaluated (lowest number first) |

### Task 1: Configure Load Balancer and Target Groups

**Steps:**

1. **Create or Use Existing ALB**:
   * Navigate to EC2 dashboard > Load Balancers
   * Choose "Create load balancer" or select an existing ALB
   * For a new ALB, configure basic settings:
     * Name: `multi-app-alb`
     * Scheme: Internet-facing
     * Select at least two Availability Zones
     * Configure appropriate security groups

2. **Create First Target Group**:
   * Navigate to EC2 dashboard > Target Groups > Create target group
   * Name: `app1-target-group`
   * Protocol: HTTP, Port: 80
   * Target type: Instances
   * VPC: Select your VPC
   * Health check path: `/app1/health`
   * Register appropriate EC2 instances

3. **Create Second Target Group**:
   * Follow same steps as above
   * Name: `app2-target-group`
   * Health check path: `/app2/health`
   * Register appropriate instances

### Task 2: Configure Routing Rules

**Steps:**

1. **Access Listener Rules**:
   * Go to your ALB's details page
   * Select the Listeners tab
   * Click "View/edit rules" for HTTP:80 or HTTPS:443 listener

2. **Create Path-based Rules**:
   * Click "Insert Rule"
   * For first rule:
     * Condition: Path pattern is `/app1*` or `/app1/*`
     * Action: Forward to `app1-target-group`
   
   * Click "Insert Rule" again
   * For second rule:
     * Condition: Path pattern is `/app2*` or `/app2/*`
     * Action: Forward to `app2-target-group`
   
   * Default rule (last one):
     * Action: Forward to a default target group or return a fixed response

3. **Set Rule Priority**:
   * Ensure specific rules are evaluated before general rules
   * Rules are evaluated in order, from top to bottom

### Task 3: Prepare and Test Applications

**Steps:**

1. **Configure Application Servers**:
   ```bash
   # On App1 server
   sudo mkdir -p /var/www/html/app1
   sudo tee /var/www/html/app1/index.html > /dev/null << EOF
   <!DOCTYPE html>
   <html>
   <head>
       <title>App 1</title>
       <style>
           body { font-family: Arial; text-align: center; margin-top: 50px; background-color: #f0f7ff; }
           .container { max-width: 800px; margin: 0 auto; padding: 20px; background-color: white; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
       </style>
   </head>
   <body>
       <div class="container">
           <h1>Application 1</h1>
           <p>This request was routed to App 1 based on the path.</p>
       </div>
   </body>
   </html>
   EOF
   
   sudo mkdir -p /var/www/html/app1/health
   echo "OK" | sudo tee /var/www/html/app1/health/index.html
   ```

2. **Test Routing Configuration**:
   * Access `http://your-alb-dns-name/app1/` in a browser
   * Access `http://your-alb-dns-name/app2/` in a browser
   * Verify each request is routed to the correct application

3. **Validate with Command Line**:
   ```bash
   curl -I http://your-alb-dns-name/app1/
   curl -I http://your-alb-dns-name/app2/
   ```

This path-based routing configuration allows you to host multiple applications or services under a single domain name, simplifying your architecture and reducing costs by sharing a single load balancer.

> **Pro Tip**: For production environments, configure HTTPS listeners with SSL/TLS certificates from AWS Certificate Manager and set up an HTTP to HTTPS redirect for improved security.

## Advanced AWS Networking and Services

> ### What You'll Learn
> - Creating secure network architectures with public and private subnets
> - Setting up secure access to private instances using a bastion host
> - Implementing NAT Gateway for outbound internet access
> - Configuring security groups for proper access control

This section covers advanced networking concepts that form the foundation of secure and scalable AWS infrastructures, focusing on proper network segmentation and secure access patterns.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **VPC (Virtual Private Cloud)** | Your own isolated section of the AWS cloud |
| **Subnets** | Segments of your VPC's IP address range with different accessibility levels |
| **NAT Gateway** | Allows instances in private subnets to access the internet while preventing inbound access |
| **Internet Gateway** | Enables communication between your VPC and the internet |
| **Route Tables** | Control the traffic flow within your VPC and to external networks |
| **Security Groups** | Virtual firewalls that control inbound and outbound traffic at the instance level |
| **Bastion Host** | A secure instance that serves as a gateway for accessing private resources |

### Task 1: Create VPC and Subnet Architecture

**Steps:**

1. **Create VPC**:
   * Navigate to VPC Dashboard > Your VPCs > Create VPC
   * Name: `secure-vpc`
   * IPv4 CIDR block: `10.0.0.0/16`
   * Create VPC

2. **Create Subnets**:
   * Navigate to VPC Dashboard > Subnets > Create subnet
   * Public subnet:
     * Name: `public-subnet-1`
     * VPC: Select `secure-vpc`
     * Availability Zone: Select first AZ
     * IPv4 CIDR block: `10.0.1.0/24`
   * Private subnet:
     * Name: `private-subnet-1`
     * VPC: Select `secure-vpc`
     * Availability Zone: Select same AZ
     * IPv4 CIDR block: `10.0.2.0/24`

3. **Create Internet Gateway**:
   * Navigate to VPC Dashboard > Internet Gateways > Create internet gateway
   * Name: `secure-vpc-igw`
   * Create and then attach to `secure-vpc`

4. **Create NAT Gateway**:
   * Navigate to VPC Dashboard > NAT Gateways > Create NAT gateway
   * Subnet: Select `public-subnet-1`
   * Connectivity type: Public
   * Elastic IP: Allocate Elastic IP
   * Create NAT gateway

### Task 2: Configure Routing

**Steps:**

1. **Create and Configure Public Route Table**:
   * Navigate to VPC Dashboard > Route Tables > Create route table
   * Name: `public-route-table`
   * VPC: Select `secure-vpc`
   * Add routes:
     * Destination: `0.0.0.0/0`, Target: Internet Gateway (`secure-vpc-igw`)
   * Associate with `public-subnet-1`

2. **Create and Configure Private Route Table**:
   * Create another route table named `private-route-table`
   * VPC: Select `secure-vpc`
   * Add routes:
     * Destination: `0.0.0.0/0`, Target: NAT Gateway (created earlier)
   * Associate with `private-subnet-1`

### Task 3: Launch and Configure EC2 Instances

**Steps:**

1. **Launch Bastion Host**:
   * Navigate to EC2 Dashboard > Instances > Launch instances
   * Name: `bastion-host`
   * AMI: Ubuntu Server 22.04 LTS
   * Instance type: t2.micro
   * Key pair: Create or select existing
   * Network settings:
     * VPC: Select `secure-vpc`
     * Subnet: Select `public-subnet-1`
     * Auto-assign public IP: Enable
   * Security group: Create new
     * Name: `bastion-sg`
     * Allow SSH (port 22) from your IP address only

2. **Launch Private Instance**:
   * Launch another instance
   * Name: `private-instance`
   * AMI: Ubuntu Server 22.04 LTS
   * Instance type: t2.micro
   * Key pair: Same as bastion
   * Network settings:
     * VPC: Select `secure-vpc`
     * Subnet: Select `private-subnet-1`
     * Auto-assign public IP: Disable
   * Security group: Create new
     * Name: `private-instance-sg`
     * Allow SSH (port 22) from Bastion security group only

### Task 4: Test Secure Connectivity

**Steps:**

1. **Transfer SSH Key to Bastion**:
   ```bash
   scp -i your-key.pem your-key.pem ubuntu@bastion-public-ip:~/
   ```

2. **Connect to Bastion Host**:
   ```bash
   ssh -i your-key.pem ubuntu@bastion-public-ip
   ```

3. **Connect to Private Instance from Bastion**:
   ```bash
   chmod 400 ~/your-key.pem
   ssh -i ~/your-key.pem ubuntu@private-instance-private-ip
   ```

4. **Verify Internet Access**:
   * From private instance:
   ```bash
   ping google.com
   ```
   * This confirms the NAT Gateway is correctly routing outbound traffic

This secure network architecture forms the foundation for hosting applications that require different levels of security and internet accessibility, while maintaining the ability to manage all resources.

> **Pro Tip**: Use AWS Systems Manager Session Manager as an alternative to bastion hosts for connecting to private instances without the need to manage SSH keys or open inbound SSH ports in your security groups.

## End-to-End Domain Configuration

> ### What You'll Learn
> - Registering and configuring a domain name in Route 53
> - Setting up DNS records to route traffic to your AWS resources in the ap-south-1 region
> - Implementing HTTPS with AWS Certificate Manager
> - Creating custom domain endpoints for multi-port applications

This section guides you through the complete process of configuring a custom domain for your AWS applications, from registration to secure certificate implementation.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **Route 53** | AWS's scalable and highly available DNS web service |
| **Hosted Zone** | Container for DNS records that define how to route traffic for a domain |
| **Record Sets** | DNS records including A, CNAME, MX, TXT, etc. |
| **AWS Certificate Manager (ACM)** | Service for provisioning and managing SSL/TLS certificates |
| **Alias Record** | Special Route 53 record that routes traffic to AWS resources |
| **Health Check** | Route 53 feature to monitor endpoint health and route traffic accordingly |

### Task 1: Register and Configure a Domain

**Steps:**

1. **Register a Domain with Route 53**:
   * Navigate to Route 53 console > Registered domains
   * Select "Register domain"
   * Enter your desired domain name and check availability
   * Complete registration with contact details
   * Wait for registration to complete (can take up to 24-48 hours)

2. **Create a Hosted Zone**:
   * If not created automatically, go to Route 53 > Hosted zones > Create hosted zone
   * Enter your domain name
   * Type: Public hosted zone
   * Create hosted zone

3. **Configure Name Servers**:
   * If using external domain registrar, update name servers to point to Route 53's name servers
   * Copy the four name servers from your hosted zone
   * Update these at your registrar's website

### Task 2: Create SSL/TLS Certificate

**Steps:**

1. **Request Certificate**:
   * Navigate to AWS Certificate Manager (ACM) > Request certificate (make sure you're in the ap-south-1 region)
   * Request a public certificate
   * Add domain names: `yourdomain.com` and `*.yourdomain.com` (wildcard)
   * Choose DNS validation
   * Request certificate

2. **Validate Certificate**:
   * Click "Create record in Route 53" for each domain entry
   * The validation records will be automatically added to your hosted zone
   * Wait for certificate to change from "Pending validation" to "Issued" status

### Task 3: Set Up DNS Records for Your Resources

**Steps:**

1. **Create Record for Web Application ALB**:
   * Route 53 > Hosted zones > Select your domain
   * Create record
   * Name: `www` (or empty for apex domain)
   * Record type: A - IPv4 address
   * Toggle "Alias"
   * Route traffic to: Application Load Balancer
   * Select region `ap-south-1` and your ALB
   * Routing policy: Simple routing
   * Create records

2. **Create Record for API Endpoint**:
   * Create another record
   * Name: `api`
   * Record type: A - IPv4 address
   * Toggle "Alias"
   * Route traffic to the appropriate resource (ALB, API Gateway, etc.)
   * Create records

3. **Set Up Email Records (Optional)**:
   * Create MX records if you want to use email with your domain
   * Add TXT records for email verification services

### Task 4: Configure HTTPS for Your Application

**Steps:**

1. **Update Load Balancer**:
   * Navigate to EC2 > Load Balancers > Select your ALB
   * Add Listener: HTTPS (port 443)
   * Default action: Forward to your target group
   * Select your ACM certificate
   * Security policy: ELBSecurityPolicy-2016-08 (or latest)
   * Add listener

2. **Redirect HTTP to HTTPS**:
   * Edit the HTTP:80 listener
   * Change action from "Forward" to "Redirect"
   * Set to redirect HTTP port 80 to HTTPS port 443
   * Status code: HTTP_301 (Permanent redirect)
   * Save changes

3. **Test Configuration**:
   ```bash
   # Test HTTP to HTTPS redirect
   curl -I http://www.yourdomain.com
   
   # Test HTTPS connection
   curl -I https://www.yourdomain.com
   
   # Test API endpoint
   curl -I https://api.yourdomain.com
   ```

4. **Configure Security Groups**:
   * Update security groups to allow traffic on port 443

With this end-to-end domain configuration, your AWS applications now have a professional, secure, and branded web presence that inspires trust in your users.

> **Pro Tip**: Use Route 53 health checks with DNS failover to automatically route traffic away from unhealthy endpoints. This creates a self-healing architecture that improves your application's availability without manual intervention.

## Cross-Account VPC Peering

> ### What You'll Learn
> - Understanding cross-account networking and its use cases
> - Creating and accepting VPC peering connections between AWS accounts
> - Configuring routes and security groups for cross-account access
> - Testing and validating inter-VPC communication

Cross-account VPC peering allows you to connect VPCs across different AWS accounts, enabling secure, private communication between resources without traversing the public internet.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **VPC Peering** | Direct network connection between two VPCs |
| **Cross-Account Access** | AWS mechanism for sharing resources across accounts |
| **CIDR Blocks** | IP address range definitions that must not overlap for peering |
| **Route Tables** | Control traffic flow between peered VPCs |
| **Security Groups** | Control instance-level access across peered VPCs |
| **Transitive Peering** | Not supported in AWS - peering relationships are one-to-one only |
| **Role Assumption** | AWS IAM mechanism for cross-account authorization |

### Task 1: Prepare VPCs in Both Accounts

**Steps:**

1. **Account A: Configure VPC**:
   * Ensure your VPC in Account A has:
     * CIDR block: `10.0.0.0/16`
     * Subnets properly configured
     * Resources you want to share access to

2. **Account B: Configure VPC**:
   * Ensure your VPC in Account B has:
     * CIDR block: `172.16.0.0/16` (must not overlap with Account A)
     * Subnets properly configured
     * Resources that need access to Account A

3. **Verify CIDR Compatibility**:
   * Ensure VPC CIDR blocks don't overlap
   * Check subnet CIDR blocks don't overlap

### Task 2: Create the VPC Peering Connection

**Steps:**

1. **Initiate Peering Request from Account A**:
   * Log in to Account A
   * Navigate to VPC Dashboard > Peering Connections > Create Peering Connection
   * Name: `AccountA-to-AccountB-Peering`
   * VPC (Requester): Select your VPC in Account A
   * Account: Another AWS account
   * Account ID: Enter Account B's 12-digit account ID
   * Region: Same as requester (if in same region)
   * VPC (Accepter): Enter VPC ID from Account B
   * Create peering connection

2. **Accept Peering Request in Account B**:
   * Log in to Account B
   * Navigate to VPC Dashboard > Peering Connections
   * Select the pending request from Account A
   * Choose Actions > Accept Request
   * Confirm acceptance

### Task 3: Configure Routing

**Steps:**

1. **Update Route Tables in Account A**:
   * VPC Dashboard > Route Tables
   * Select route table associated with subnet requiring access
   * Edit routes
   * Add route:
     * Destination: Account B's VPC CIDR block (`172.16.0.0/16`)
     * Target: VPC Peering Connection (`pcx-xxxxxxxx`)
   * Save changes

2. **Update Route Tables in Account B**:
   * Log in to Account B
   * VPC Dashboard > Route Tables
   * Select appropriate route table
   * Edit routes
   * Add route:
     * Destination: Account A's VPC CIDR block (`10.0.0.0/16`)
     * Target: VPC Peering Connection (`pcx-xxxxxxxx`)
   * Save changes

### Task 4: Configure Security Groups

**Steps:**

1. **Update Security Group in Account A**:
   * Navigate to EC2 > Security Groups
   * Select security group for resources needing access
   * Add inbound rule:
     * Type: Required protocol (e.g., SSH, HTTP)
     * Source: Account B's VPC CIDR (`172.16.0.0/16`)
   * Save rules

2. **Update Security Group in Account B**:
   * Log in to Account B
   * Navigate to EC2 > Security Groups
   * Select appropriate security group
   * Add inbound rule:
     * Type: Required protocol
     * Source: Account A's VPC CIDR (`10.0.0.0/16`)
   * Save rules

### Task 5: Test Cross-Account Communication

**Steps:**

1. **Launch Test Instances if Needed**:
   * Launch an EC2 instance in each VPC if not already available
   * Note the private IP addresses of each instance

2. **Test Connectivity from Account A to B**:
   * Connect to an instance in Account A's VPC
   * Ping or SSH to instance in Account B:
   ```bash
   ping 172.16.x.x  # Private IP of Account B instance
   ssh -i key.pem ubuntu@172.16.x.x  # If SSH allowed
   ```

3. **Test Connectivity from Account B to A**:
   * Connect to an instance in Account B's VPC
   * Ping or SSH to instance in Account A:
   ```bash
   ping 10.0.x.x  # Private IP of Account A instance
   ssh -i key.pem ubuntu@10.0.x.x  # If SSH allowed
   ```

4. **Verify Application Connectivity**:
   * Test any application-specific connections needed between accounts

Cross-account VPC peering enables you to create advanced multi-account architectures for improved security, organizational boundaries, and specialized workload isolation while maintaining secure private connectivity.

> **Pro Tip**: Document your cross-account networking carefully. Create a CIDR allocation plan to avoid overlapping IP ranges as you scale your multi-account strategy. Consider using AWS Transit Gateway for more complex architectures with multiple interconnected VPCs across accounts.

## EBS Snapshots and AMIs

> ### What You'll Learn
> - Creating and managing EBS snapshots for data backup
> - Automating snapshot lifecycle with policies
> - Building custom AMIs from existing instances
> - Sharing and copying AMIs across regions and accounts
> - Using AMIs for consistent and rapid deployments

This section covers essential techniques for data persistence and system replication in AWS, focusing on EBS snapshots for data backup and AMIs for system image management.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **EBS (Elastic Block Store)** | Persistent block storage volumes for EC2 instances |
| **Snapshot** | Point-in-time copy of an EBS volume stored in S3 |
| **AMI (Amazon Machine Image)** | Template containing software configuration (OS, applications, etc.) for instance launch |
| **Incremental Backup** | Only blocks changed since last snapshot are saved, improving efficiency |
| **Lifecycle Policy** | Automated management of snapshots creation and deletion |
| **Golden AMI** | Fully configured AMI that meets organizational standards and security requirements |

### Task 1: Create and Manage EBS Snapshots

**Steps:**

1. **Create a Manual EBS Snapshot**:
   * Navigate to EC2 dashboard > Volumes
   * Select volume to snapshot
   * Actions > Create snapshot
   * Add description: `Manual backup of [purpose] volume`
   * Add tags (e.g., Name, Environment)
   * Create snapshot

2. **Create Snapshot Lifecycle Policy**:
   * Navigate to EC2 dashboard > Lifecycle Manager > Create snapshot lifecycle policy
   * Target resource type: Volume
   * Tag-based selection: Add tags that identify volumes to snapshot
   * Schedule details:
     * Schedule name: `Daily-backup`
     * Frequency: Daily
     * Every: 1 day
     * Starting at: `03:00 UTC` (off-peak hours)
   * Retention rule: Retain 7 recent snapshots
   * IAM role: Default or custom role with appropriate permissions
   * Create policy

3. **Monitor and Restore Snapshots**:
   * Navigate to EC2 dashboard > Snapshots to view all snapshots
   * To restore:
     * Select snapshot
     * Actions > Create volume
     * Configure volume size and type
     * Create volume
     * Once created, attach volume to an instance

### Task 2: Create and Use AMIs

**Steps:**

1. **Prepare an Instance for AMI Creation**:
   ```bash
   # Connect to your instance
   ssh -i key.pem ubuntu@instance-public-ip
   
   # Update all packages
   sudo apt update && sudo apt upgrade -y
   
   # Remove any instance-specific data
   sudo rm -rf /tmp/*
   sudo rm -f /var/log/cloud-init*.log
   sudo rm -f /var/log/cloud-init-output.log
   
   # Clear bash history
   cat /dev/null > ~/.bash_history && history -c
   ```

2. **Create a Custom AMI**:
   * EC2 dashboard > Instances
   * Select your prepared instance
   * Actions > Image and Templates > Create image
   * Image name: `web-server-base-v1`
   * Image description: Detailed description of included software and configuration
   * No reboot: Leave unchecked (ensures consistent state)
   * Add tags (e.g., Name, Version, Environment)
   * Create image

3. **Launch Instance from AMI**:
   * EC2 dashboard > AMIs
   * Select your custom AMI
   * Actions > Launch instance from AMI
   * Complete the instance launch wizard
   * Launch instance

4. **Share AMI Across Accounts**:
   * EC2 dashboard > AMIs
   * Select your AMI
   * Actions > Edit AMI permissions
   * For private sharing:
     * Shared accounts: Enter account ID to share with
   * Save changes

### Task 3: Copy AMI to Another Region

**Steps:**

1. **Copy AMI**:
   * EC2 dashboard > AMIs
   * Select your AMI
   * Actions > Copy AMI
   * Destination region: Select target region (e.g., ap-northeast-1 or ap-southeast-1)
   * Name: Keep or modify name
   * Description: Optional - update for new region
   * Copy AMI

2. **Launch in Destination Region**:
   * Switch to destination region (e.g., from ap-south-1 to ap-northeast-1)
   * EC2 dashboard > AMIs > Owned by me
   * Find copied AMI (may take a few minutes to appear)
   * Launch instance using standard procedure

### Task 4: Implement a Backup Strategy

**Steps:**

1. **Create Automated Backup Policy**:
   * Define backup requirements:
     * Frequency: Daily, weekly, or monthly snapshots
     * Retention: How long to keep backups
     * Coverage: Which volumes to include

2. **Implement with AWS Backup**:
   * Navigate to AWS Backup console
   * Create backup plan
   * Define schedule, lifecycle, and vault
   * Assign resources using tags
   * Activate plan

3. **Test Backup and Recovery**:
   * Periodically test restoration process
   * Document recovery time objectives
   * Validate restored data integrity

These backup and image management techniques ensure your data is protected and your systems can be consistently deployed across your AWS environment, reducing manual configuration and improving disaster recovery capabilities.

> **Pro Tip**: Practice the "golden AMI pipeline" approach by creating a base AMI, using infrastructure as code to layer configurations on top, and regularly updating the base AMI with security patches. This hybrid approach gives you both consistency and flexibility.

## Custom IAM Policies

> ### What You'll Learn
> - Understanding IAM policy components and structure
> - Creating custom policies for fine-grained EC2 access control
> - Implementing the principle of least privilege
> - Using policy conditions for enhanced security
> - Testing IAM permissions before deployment

This section explores how to create custom IAM policies that provide precise access control to your EC2 resources while maintaining security best practices.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **IAM (Identity and Access Management)** | AWS service for securely controlling access to resources |
| **Policy** | Document that defines permissions for IAM identities or resources |
| **Principal** | Entity allowed or denied access to a resource |
| **Action** | Specific API operations that can be allowed or denied |
| **Resource** | AWS service objects that a principal can take action on |
| **Condition** | Optional restrictions that determine when a policy is in effect |
| **Effect** | Whether to allow or deny access to the specified resources |
| **Least Privilege Principle** | Granting only the permissions required to perform a task |

### Task 1: Analyze Access Requirements

**Steps:**

1. **Define Access Needs**:
   * Identify which EC2 actions users need to perform
   * Determine which EC2 resources users should access
   * Specify any conditions for access (e.g., IP ranges, time constraints)
   * Consider organizing by job function or team

2. **Review AWS Managed Policies**:
   * Navigate to IAM dashboard > Policies
   * Filter for EC2-related policies
   * Review `AmazonEC2FullAccess` and `AmazonEC2ReadOnlyAccess`
   * Determine if managed policies meet your needs or require customization

### Task 2: Create Custom EC2 Operator Policy

**Steps:**

1. **Create New Policy**:
   * IAM dashboard > Policies > Create policy
   * Choose the JSON tab
   * Enter policy document:

   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "AllowEC2InstanceOperations",
         "Effect": "Allow",
         "Action": [
           "ec2:DescribeInstances",
           "ec2:StartInstances",
           "ec2:StopInstances",
           "ec2:RebootInstances"
         ],
         "Resource": "arn:aws:ec2:*:*:instance/*",
         "Condition": {
           "StringEquals": {
             "aws:ResourceTag/Department": "DevOps"
           }
         }
       },
       {
         "Sid": "AllowEC2GeneralDescribeActions",
         "Effect": "Allow",
         "Action": [
           "ec2:Describe*"
         ],
         "Resource": "*"
       }
     ]
   }
   ```

2. **Review and Create Policy**:
   * Click Review policy
   * Name: `EC2OperatorCustomPolicy`
   * Description: "Allows start, stop, reboot operations on instances tagged with Department:DevOps"
   * Create policy

### Task 3: Create Instance Deployment Policy

**Steps:**

1. **Create New Policy**:
   * IAM dashboard > Policies > Create policy
   * Choose the JSON tab
   * Enter policy document:

   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "AllowLaunchingEC2Instances",
         "Effect": "Allow",
         "Action": [
           "ec2:RunInstances"
         ],
         "Resource": [
           "arn:aws:ec2:*:*:instance/*",
           "arn:aws:ec2:*:*:volume/*",
           "arn:aws:ec2:*:*:network-interface/*"
         ],
         "Condition": {
           "StringEquals": {
             "aws:RequestTag/Environment": ["Dev", "Test"]
           }
         }
       },
       {
         "Sid": "AllowAMIAndSubnetUsage",
         "Effect": "Allow",
         "Action": "ec2:RunInstances",
         "Resource": [
           "arn:aws:ec2:*:*:subnet/subnet-*",
           "arn:aws:ec2:*:*:image/ami-*"
         ]
       },
       {
         "Sid": "RequireTaggingOnResourceCreation",
         "Effect": "Allow",
         "Action": "ec2:CreateTags",
         "Resource": "*",
         "Condition": {
           "StringEquals": {
             "ec2:CreateAction": "RunInstances"
           }
         }
       },
       {
         "Sid": "AllowDescribing",
         "Effect": "Allow",
         "Action": [
           "ec2:Describe*"
         ],
         "Resource": "*"
       }
     ]
   }
   ```

2. **Review and Create Policy**:
   * Click Review policy
   * Name: `EC2DeploymentCustomPolicy`
   * Description: "Allows EC2 instance creation with required tagging for Dev and Test environments"
   * Create policy

### Task 4: Attach and Test Policies

**Steps:**

1. **Create Test User or Role**:
   * IAM dashboard > Users > Add users
   * User name: `ec2-operator-test`
   * Access type: AWS Management Console access
   * Console password: Custom password
   * Next: Permissions

2. **Attach Custom Policies**:
   * Filter policies by name: `EC2OperatorCustomPolicy`
   * Select the policy
   * Next: Tags > Next: Review > Create user

3. **Test EC2 Operator Policy**:
   * Log in as the test user
   * Navigate to EC2 dashboard
   * Verify user can view all instances
   * Attempt to start/stop instances with and without the required tag
   * Confirm permission boundaries work as expected

4. **Refine Policy as Needed**:
   * Based on testing results, edit the policy to adjust permissions
   * Common adjustments:
     * Add additional required actions
     * Modify resource ARNs to be more specific
     * Add or modify conditions

### Task 5: Add MFA Enforcement (Advanced)

**Steps:**

1. **Update Policy with MFA Condition**:
   * Edit your custom policy
   * Add a condition block requiring MFA:
   
   ```json
   "Condition": {
     "Bool": {
       "aws:MultiFactorAuthPresent": "true"
     }
   }
   ```

2. **Test MFA Enforcement**:
   * Configure MFA for test user
   * Test access with and without MFA authentication
   * Verify policy enforcement works as expected

These custom IAM policies provide fine-grained control over your AWS resources, ensuring users can only perform authorized actions on specific resources, aligning with security best practices and regulatory compliance requirements.

> **Pro Tip**: Use AWS IAM Access Analyzer to review policies for security issues or unintended access. It can identify resources shared with external entities and help validate that your policies provide only the intended access.

## S3 Buckets with AWS CLI

> ### What You'll Learn
> - Installing and configuring the AWS CLI
> - Creating and managing S3 buckets via command line
> - Uploading, downloading, and synchronizing files
> - Setting bucket policies and access controls
> - Implementing lifecycle policies for cost optimization

This section covers how to efficiently manage Amazon S3 storage using the AWS Command Line Interface, providing you with powerful scripting capabilities for automation.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **AWS CLI** | Command line tool for interacting with AWS services |
| **S3 (Simple Storage Service)** | Object storage service offering scalability, availability, and security |
| **Bucket** | Container for objects stored in S3 |
| **Object** | File and any metadata that describes the file stored in S3 |
| **Prefix** | S3 way to organize data in a hierarchy similar to directories |
| **Lifecycle Policy** | Rules to automatically transition objects between storage classes or delete them |
| **Versioning** | Feature that keeps multiple variants of an object in the same bucket |
| **Presigned URL** | URL that grants temporary access to specific S3 objects |

### Task 1: Install and Configure AWS CLI

**Steps:**

1. **Install AWS CLI**:
   ```bash
   # For Ubuntu
   sudo apt update
   sudo apt install -y unzip
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   
   # For macOS
   curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
   sudo installer -pkg AWSCLIV2.pkg -target /
   
   # For Windows (PowerShell)
   msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
   ```

2. **Configure AWS CLI**:
   ```bash
   aws configure
   ```
   * Enter your AWS Access Key ID
   * Enter your AWS Secret Access Key
   * Default region name: `ap-south-1` (Mumbai region)
   * Default output format: `json`

3. **Verify Installation**:
   ```bash
   aws --version
   aws sts get-caller-identity
   aws configure get region  # Should return ap-south-1
   ```

### Task 2: Create and Manage S3 Buckets

**Steps:**

1. **Create a Bucket**:
   ```bash
   # Create bucket with default settings
   aws s3 mb s3://my-unique-bucket-name-123

   # Create bucket with specific region
   aws s3 mb s3://my-unique-bucket-name-123 --region ap-south-1
   ```

2. **List Buckets**:
   ```bash
   # List all buckets
   aws s3 ls
   
   # List contents of specific bucket
   aws s3 ls s3://my-unique-bucket-name-123
   
   # List contents recursively
   aws s3 ls s3://my-unique-bucket-name-123 --recursive
   ```

3. **Enable Bucket Versioning**:
   ```bash
   aws s3api put-bucket-versioning --bucket my-unique-bucket-name-123 --versioning-configuration Status=Enabled
   ```

### Task 3: Upload and Download Files

**Steps:**

1. **Upload Files**:
   ```bash
   # Upload a single file
   aws s3 cp local-file.txt s3://my-unique-bucket-name-123/ --region ap-south-1
   
   # Upload with custom metadata
   aws s3 cp local-file.txt s3://my-unique-bucket-name-123/ --metadata "key1=value1,key2=value2"
   
   # Upload a directory recursively
   aws s3 cp my-local-directory/ s3://my-unique-bucket-name-123/remote-directory/ --recursive
   ```

2. **Download Files**:
   ```bash
   # Download a single file
   aws s3 cp s3://my-unique-bucket-name-123/remote-file.txt ./local-file.txt
   
   # Download a directory recursively
   aws s3 cp s3://my-unique-bucket-name-123/remote-directory/ ./local-directory/ --recursive
   ```

3. **Synchronize Directories**:
   ```bash
   # Sync local to S3 (upload only changed files)
   aws s3 sync ./local-directory/ s3://my-unique-bucket-name-123/remote-directory/ --region ap-south-1
   
   # Sync S3 to local (download only changed files)
   aws s3 sync s3://my-unique-bucket-name-123/remote-directory/ ./local-directory/
   
   # Sync with deletion (remove files not in source)
   aws s3 sync ./local-directory/ s3://my-unique-bucket-name-123/remote-directory/ --delete
   ```

### Task 4: Set Bucket Policies and ACLs

**Steps:**

1. **Create a Bucket Policy File**:
   ```bash
   cat > bucket-policy.json << EOF
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "PublicReadForGetBucketObjects",
         "Effect": "Allow",
         "Principal": "*",
         "Action": "s3:GetObject",
         "Resource": "arn:aws:s3:::my-unique-bucket-name-123/*"
       }
     ]
   }
   EOF
   ```

2. **Apply Bucket Policy**:
   ```bash
   aws s3api put-bucket-policy --bucket my-unique-bucket-name-123 --policy file://bucket-policy.json --region ap-south-1
   ```

3. **Make Object Public**:
   ```bash
   # Using ACL
   aws s3api put-object-acl --bucket my-unique-bucket-name-123 --key remote-file.txt --acl public-read
   ```

4. **Generate Presigned URL**:
   ```bash
   # Create a URL that expires in 1 hour (3600 seconds)
   aws s3 presign s3://my-unique-bucket-name-123/remote-file.txt --expires-in 3600
   ```

### Task 5: Implement Lifecycle Policies

**Steps:**

1. **Create Lifecycle Policy File**:
   ```bash
   cat > lifecycle-policy.json << EOF
   {
     "Rules": [
       {
         "ID": "ArchiveAndDelete",
         "Status": "Enabled",
         "Filter": {
           "Prefix": "logs/"
         },
         "Transitions": [
           {
             "Days": 30,
             "StorageClass": "STANDARD_IA"
           },
           {
             "Days": 90,
             "StorageClass": "GLACIER"
           }
         ],
         "Expiration": {
           "Days": 365
         }
       }
     ]
   }
   EOF
   ```

2. **Apply Lifecycle Policy**:
   ```bash
   aws s3api put-bucket-lifecycle-configuration --bucket my-unique-bucket-name-123 --lifecycle-configuration file://lifecycle-policy.json
   ```

3. **Verify Lifecycle Policy**:
   ```bash
   aws s3api get-bucket-lifecycle-configuration --bucket my-unique-bucket-name-123
   ```

### Task 6: Clean Up Resources

**Steps:**

1. **Delete Objects**:
   ```bash
   # Delete single object
   aws s3 rm s3://my-unique-bucket-name-123/remote-file.txt
   
   # Delete multiple objects
   aws s3 rm s3://my-unique-bucket-name-123/remote-directory/ --recursive
   ```

2. **Delete Empty Bucket**:
   ```bash
   aws s3 rb s3://my-unique-bucket-name-123
   ```

3. **Force Delete Bucket with Contents**:
   ```bash
   aws s3 rb s3://my-unique-bucket-name-123 --force
   ```

The AWS CLI provides powerful automation capabilities for S3, allowing you to integrate storage operations into your scripts and workflows. This can significantly enhance your productivity when working with cloud storage at scale.

> **Pro Tip**: For frequent operations or teams with multiple AWS accounts, create named profiles using `aws configure --profile profile-name` and use them with `--profile profile-name` in your commands. This allows you to quickly switch between different AWS accounts without reconfiguring.