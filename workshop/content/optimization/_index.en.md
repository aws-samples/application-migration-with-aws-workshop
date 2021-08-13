+++
title = "Optimization"
weight = 40
pre = "<b>3. </b>"

+++


Congratulation's, since you're here, you've managed to migrate an e-commerce application into AWS and can now look for ways to optimize the architecture to make it even more secure, highly-performant, resilient and so that is uses AWS infrastructure efficiently!

Below you will find ideas about what you can do taking into account <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 AWS Well-Architected Pillars</a> - Operational Excellence, Security, Reliability, Performance Efficiency  and Cost Optimization.

You can also learn more about **AWS Well Architected** by watching the video below.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Operational Excellence

- Configure a <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">CloudWatch dashboard</a> to monitor your resources in a single view, even across AWS regions.
- Configure a <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">persistent CloudTrail trail</a> to be able to monitor, audit and alert on what is happening in your AWS accounts

### Security  
- Switch to HTTPS with <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> managed SSL/TLS certificates to encrypt customer data in transit (certificates are already provisioned in this workshop!)
- <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Encrypt EBS volumes</a> to protect customer data at rest
- Enable <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> to protect your web application from known attacks (you can do it on <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> or event better on the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront distribution</a>)
- Use <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> to protect your AWS account and workloads with intelligent threat detection and continuous monitoring

### Reliability
- Configure an <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> to distribute Webserver traffic across multiple Availability Zones
- Configure <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling Group</a> to enable auto-healing in case Webserver instances go down and to handle changing customer load
- Use <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - a fast Content Distribution Network that securely delivers data to customers globally with low latency and high transfer speeds, integrating seamlessly with <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> for DDoS mitigation.

### Performance Efficiency
- Deploy <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> to handle changes of files on Webservers
- Use <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront with AWS S3</a> as custom origin to distribute static content for lower latency for your customers and lower cost

### Cost optimization
- Use <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">Amazon EC2 Spot instances</a> - select machine type using <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, some instances allow for **90% savings** with <5% interruption frequency
- Use the most <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">cost-optimized machine types</a>

### Reference architecture

Diagram below depicts a reference architecture of the solution, with all components listed above deployed.

![Reference Architecture](/opt/aws-ref-arch.png)

For more details see the <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">Reference Architecture for Wordpress on AWS</a>!
