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

Let's face it – in today's fast-paced digital world, [**cloud computing**](https://aws.amazon.com/what-is-cloud-computing/) has evolved from just another tech buzzword into the very **foundation** of modern IT infrastructure. Look beyond the marketing hype, and you'll discover a truly *powerful concept* that's completely changing **how businesses operate and scale** their technology.

## The Power of Cloud Computing

Think about it – cloud computing gives you ***on-demand access*** to computing resources whenever you need them. Need applications? Data centers? It's all available over the internet, and you only **pay for what you use**. Remember the days of massive upfront server investments? That's history! This clever shift from [*capital expenditure* to *operational expenditure*](https://aws.amazon.com/blogs/aws/reducing-capital-expenditures-with-aws/) has democratized access to enterprise-grade technology, making it **accessible to businesses of all sizes**. Even small startups can now leverage the same advanced infrastructure that was once the exclusive domain of tech giants.

### Understanding IaaS: The Foundation of Cloud Architecture

You've probably heard about the "cloud service models" – ([SaaS](https://aws.amazon.com/what-is-saas/), [PaaS](https://aws.amazon.com/what-is-paas/), and [**IaaS**](https://aws.amazon.com/what-is/iaas/)). While they're all important, let's focus on ***Infrastructure as a Service (IaaS)*** – it's truly the **most fundamental layer** of them all. Think of IaaS as providing the *essential building blocks* for your cloud IT – the digital equivalent of the concrete, steel, and electrical systems of a physical building:

| Resource Type | What You Get | Traditional Equivalent |
|---------------|-------------|------------------------|
| **[Compute](https://aws.amazon.com/products/compute/)** | *Virtual machines* with configurable CPU and RAM | Physical servers in a data center |
| **[Storage](https://aws.amazon.com/products/storage/)** | [*Block*](https://aws.amazon.com/ebs/), [*object*](https://aws.amazon.com/s3/), and [*file storage*](https://aws.amazon.com/efs/) options | SANs, NAS devices, and disk arrays |
| **[Networking](https://aws.amazon.com/products/networking/)** | [*Virtual networks*](https://aws.amazon.com/vpc/), subnets, IP addresses, [*load balancers*](https://aws.amazon.com/elasticloadbalancing/) | Routers, switches, firewalls, and load balancers |
| **[Security](https://aws.amazon.com/security/)** | [*Identity management*](https://aws.amazon.com/iam/), access control, [*encryption*](https://aws.amazon.com/kms/) | Physical security, firewalls, and network policies |

Here's what makes IaaS so powerful: it offers you the **highest level of flexibility** and **management control** over your IT resources. Instead of dropping a fortune on hardware that might be obsolete next year, you can *rent exactly what you need, precisely when you need it*. Need more power during holiday shopping season? **Scale up**. Slower summer months? **Scale down**. All this flexibility while still maintaining *complete control* over how everything is configured and managed. It's your infrastructure, just without the headaches of physical ownership.

### AWS: The Pioneer of Cloud IaaS

Let's talk about the elephant in the room when it comes to IaaS providers – **[Amazon Web Services (AWS)](https://aws.amazon.com/)**. AWS isn't just another player; they're the **pioneer** who blazed the trail and remain the **industry leader** today. When AWS launched back in 2006, they didn't just enter the market – they *fundamentally changed* the entire game of how businesses approach IT infrastructure. Look at what they bring to the table:

- An incredible lineup of over **200 fully featured** [services](https://aws.amazon.com/products/) you can access from practically *anywhere on Earth*
- A massive global footprint spanning [**27 geographic regions**](https://aws.amazon.com/about-aws/global-infrastructure/) with **87** [*availability zones*](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/) – meaning your applications can be closer to your users
- Rock-solid [*security capabilities*](https://aws.amazon.com/security/) and [*compliance certifications*](https://aws.amazon.com/compliance/programs/) that let you sleep at night
- **Unmatched scale and reliability** whether you're a scrappy startup or a Fortune 500 giant

Ready to dive in? Throughout this **comprehensive guide**, I'll show you how to harness AWS's *powerful IaaS offerings* to build cloud solutions that are **robust**, **scalable**, and **cost-effective** – the kind that can truly *transform* what your infrastructure can do.

## What We'll Cover

| Section | Key Learning |
|---------|-------------|
| **Deploying Web Applications** | Building scalable infrastructure with [EC2](https://aws.amazon.com/ec2/), [ALB](https://aws.amazon.com/elasticloadbalancing/application-load-balancer/), and [ASG](https://aws.amazon.com/ec2/autoscaling/) |
| **Path-Based Routing** | Directing traffic to different services using [ALB rules](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-update-rules.html) |
| **Advanced Networking** | Implementing [private/public subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html) with secure [bastion access](https://aws.amazon.com/quickstart/architecture/linux-bastion/) |
| **Domain Configuration** | Setting up end-to-end routing for multi-port applications with [Route 53](https://aws.amazon.com/route53/) |
| **Cross-Account VPC Peering** | Establishing secure [connectivity between AWS accounts](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html) |
| **EBS & AMI Management** | Creating [snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html) and [images](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) for data persistence |
| **IAM Policy Creation** | Implementing [fine-grained access control](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html) for EC2 |
| **S3 Bucket Operations** | Managing storage using [AWS CLI](https://aws.amazon.com/cli/) |

## Deploying a Web Application on AWS

### What You'll Learn

* Setting up [EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html) and installing web server software
* Creating an [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html) for traffic distribution
* Configuring [Auto Scaling Groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html) to automatically adjust capacity
* Testing and verifying [scaling behavior](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html) under load

In this section, we're going to roll up our sleeves and build something special – a truly **resilient** and **scalable** web application infrastructure on AWS. We'll bring together *multiple IaaS components* like pieces of a puzzle to create a **robust architecture** that doesn't just handle traffic but *automatically adjusts* to demands. No more late-night scrambles when your site hits the front page of Reddit!

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[EC2 (Elastic Compute Cloud)](https://aws.amazon.com/ec2/)** | Virtual servers in the cloud that provide resizable compute capacity |
| **[ALB (Application Load Balancer)](https://aws.amazon.com/elasticloadbalancing/application-load-balancer/)** | Distributes incoming application traffic across multiple targets |
| **[ASG (Auto Scaling Group)](https://aws.amazon.com/ec2/autoscaling/)** | Maintains application availability by automatically adding or removing EC2 instances |
| **[AMI (Amazon Machine Image)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)** | Pre-configured templates used for EC2 instance creation |
| **[Launch Template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html)** | Contains configuration information to launch instances in an ASG |

### Task 1: Deploy Web Application on EC2 Instances

**Steps:**

1. **Launch EC2 Instances**:
   * Navigate to [EC2 dashboard](https://console.aws.amazon.com/ec2/) > [Launch Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
   * Select an [AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) (e.g., [Ubuntu Server 22.04 LTS](https://aws.amazon.com/marketplace/pp/prodview-iftkyuwv2sjxi))
   * Choose [instance type](https://aws.amazon.com/ec2/instance-types/) (e.g., `t2.micro`)
   * Configure [network settings](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html) (VPC, subnets)
   * Add [security groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html) (allow HTTP/SSH)
   * Launch at least two instances with a [key pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

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

What have we accomplished? We've built a rock-solid architecture that keeps your application humming along even when traffic suddenly spikes – like when that marketing campaign finally goes viral! And the best part? It optimizes costs by automatically scaling down during quieter periods. No more paying for idle servers at 3 AM!

**Pro Tip**: Always, and I mean always, create your EC2 instances across [multiple Availability Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html). Think of it as not keeping all your eggs in one basket. If one AZ has a hiccup (and yes, it happens!), your application keeps running smoothly from instances in other AZs. Your users won't even notice the difference.

## Path-based Routing in AWS Application Load Balancer

### What You'll Learn

* Creating and configuring [target groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html) for different applications
* Implementing [path-based routing rules](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#path-conditions) in an ALB
* Testing and verifying routing configuration  
* Managing multiple services behind a [single load balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)

Ever wondered how major websites serve different parts of their application from one domain? That's where [**path-based routing**](https://aws.amazon.com/blogs/aws/new-path-based-routing-for-aws-application-load-balancer/) comes in! It's like having a smart traffic cop that *directs visitors* to different backend services based on the **URL path** they're requesting. Want to visit `/api`? You'll be sent to the API servers. Looking for `/blog`? You'll get routed to the blog servers. This approach is incredibly handy when you're running [*microservices*](https://aws.amazon.com/microservices/) or need to manage **multiple application components** while presenting them to users under a single, clean URL.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[Listener](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html)** | Process that checks for connection requests using a specified protocol and port |
| **[Target Group](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html)** | Group of resources (EC2 instances, containers, IP addresses) that receive traffic |
| **[Routing Rules](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-update-rules.html)** | Conditions that determine how requests are forwarded to target groups |
| **[Path Pattern](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#path-conditions)** | URL pattern used to match and route requests to specific target groups |
| **[Rule Priority](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#rule-priority)** | Determines the order in which rules are evaluated (lowest number first) |

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

**Pro Tip**: If you're setting this up for production (and I hope you are!), don't skip on security. Take a few extra minutes to configure [HTTPS listeners](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html) with SSL/TLS certificates from [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/) (they're free!). While you're at it, set up an [HTTP to HTTPS redirect](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#redirect-actions) so your users are always on the secure version of your site. In today's world, encryption isn't optional – it's essential.

## Advanced AWS Networking and Services

### What You'll Learn

* Creating secure network architectures with [public and private subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html)
* Setting up secure access to private instances using a [bastion host](https://aws.amazon.com/quickstart/architecture/linux-bastion/)
* Implementing [NAT Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) for outbound internet access
* Configuring [security groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html) for proper access control

Now we're going to dive into the really good stuff – the advanced networking concepts that truly form the backbone of secure and scalable [AWS infrastructures](https://aws.amazon.com/architecture/). If you've been following along, you're about to level up your AWS skills with proper [network segmentation](https://aws.amazon.com/answers/networking/aws-multiple-region-network-connectivity/) and secure access patterns. These are the techniques that separate AWS hobbyists from true cloud architects!

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[VPC (Virtual Private Cloud)](https://aws.amazon.com/vpc/)** | Your own isolated section of the AWS cloud |
| **[Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)** | Segments of your VPC's IP address range with different accessibility levels |
| **[NAT Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)** | Allows instances in private subnets to access the internet while preventing inbound access |
| **[Internet Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)** | Enables communication between your VPC and the internet |
| **[Route Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)** | Control the traffic flow within your VPC and to external networks |
| **[Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)** | Virtual firewalls that control inbound and outbound traffic at the instance level |
| **[Bastion Host](https://aws.amazon.com/quickstart/architecture/linux-bastion/)** | A secure instance that serves as a gateway for accessing private resources |

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

* Registering and configuring a domain name in [Route 53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
* Setting up [DNS records](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/rrsets-working-with.html) to route traffic to your AWS resources in the [ap-south-1 region](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/?p=ngi&loc=4)
* Implementing [HTTPS with AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html)
* Creating [custom domain endpoints](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-elb-load-balancer.html) for multi-port applications

This section guides you through the complete process of configuring a custom domain for your AWS applications, from registration to secure certificate implementation.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[Record Sets](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/rrsets-working-with.html)** | DNS records including A, CNAME, MX, TXT, etc. |
| **[AWS Certificate Manager (ACM)](https://aws.amazon.com/certificate-manager/)** | Service for provisioning and managing SSL/TLS certificates |
| **[Alias Record](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html)** | Special Route 53 record that routes traffic to AWS resources |
| **[Health Check](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html)** | Route 53 feature to monitor endpoint health and route traffic accordingly |

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

* Creating and accepting [VPC peering connections](https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html) between AWS accounts
* Configuring [routes](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-routing.html) and [security groups](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-security-groups.html) for cross-account access
* Testing and validating [inter-VPC communication](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-connectivity-scenarios.html)

Cross-account VPC peering allows you to connect VPCs across different AWS accounts, enabling secure, private communication between resources without traversing the public internet.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[Route Tables](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-routing.html)** | Control traffic flow between peered VPCs |
| **[Security Groups](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-security-groups.html)** | Control instance-level access across peered VPCs |
| **[Transitive Peering](https://docs.aws.amazon.com/vpc/latest/peering/invalid-peering-configurations.html)** | Not supported in AWS - peering relationships are one-to-one only |
| **[Role Assumption](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html)** | AWS IAM mechanism for cross-account authorization |

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

* Automating snapshot lifecycle with [policies](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html)
* Building [custom AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html) from existing instances
* [Sharing](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sharingamis-explicit.html) and [copying](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html) AMIs across regions and accounts
* Using AMIs for [consistent and rapid deployments](https://aws.amazon.com/blogs/compute/query-for-the-latest-amazon-linux-ami-ids-using-aws-systems-manager-parameter-store/)

This section covers essential techniques for data persistence and system replication in AWS, focusing on EBS snapshots for data backup and AMIs for system image management.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[Incremental Backup](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html#how_snapshots_work)** | Only blocks changed since last snapshot are saved, improving efficiency |
| **[Lifecycle Policy](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html)** | Automated management of snapshots creation and deletion |
| **[Golden AMI](https://aws.amazon.com/blogs/awsmarketplace/building-and-maintaining-secure-golden-amis/)** | Fully configured AMI that meets organizational standards and security requirements |

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

* Creating [custom policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_create.html) for fine-grained EC2 access control
* Implementing the [principle of least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)
* Using [policy conditions](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html) for enhanced security
* Testing [IAM permissions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html) before deployment

This section explores how to create custom IAM policies that provide precise access control to your EC2 resources while maintaining security best practices.

### Key Concepts

| Concept | Description |
|---------|-------------|
| **[Action](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_action.html)** | Specific API operations that can be allowed or denied |
| **[Resource](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_resource.html)** | AWS service objects that a principal can take action on |
| **[Condition](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html)** | Optional restrictions that determine when a policy is in effect |
| **[Effect](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_effect.html)** | Whether to allow or deny access to the specified resources |
| **[Least Privilege Principle](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)** | Granting only the permissions required to perform a task |

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

* [Creating and managing S3 buckets](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html) via command line
* [Uploading, downloading, and synchronizing](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html) files
* Setting bucket policies and access controls
* Implementing lifecycle policies for cost optimization

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