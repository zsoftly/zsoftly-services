---
title: Bypassing VPN Failure with AWS SSM Port Forwarding
date: 2025-10-15
author: ZSoftly Team
tags: [aws, security, case-study, devops]
---

![Secure cloud connection](https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=800&h=400&fit=crop&crop=center)

## 🔒 Secure RDP Tunnel via AWS SSM Port Forwarding

### The Critical Need: Bypassing VPN Failure

> **Story:** Imagine the alarm sirens going off today: a critical **database server** is nearing **100% disk usage**. But disaster strikes twice—the **corporate VPN is down**, blocking all traditional access to servers in private subnets. With time running out, the on-call engineer can't RDP in to clear logs or manage the database, risking a catastrophic server crash that brings down a core service. This procedure ensures that **service management remains possible**, even when the VPN or corporate network access fails, by using the secure, out-of-band AWS backbone.

This document details how to use **AWS Systems Manager (SSM) Port Forwarding** to create a secure tunnel for Remote Desktop Protocol (RDP) access to a Windows EC2 instance. This method securely bypasses the need for a VPN or open network ports.

-----

## 1\. Prerequisites 📋

  * **AWS CLI:** Must be configured and authenticated (e.g., using a configured profile).
  * **SSM Agent:** The target Windows EC2 instance must have the SSM Agent installed and running.
  * **Credentials:** Your authentication credentials must be active and authorized to log into the Windows instance.

-----

## 2\. Procedure 🛠️

### Step 1: Start the Tunnel (Keep this command running)

Execute the following command in your terminal. This initiates the SSM session and starts forwarding the target's RDP port (`3389`) to a local port on your machine (`13389`).

```bash
aws ssm start-session \
  --target <instance-id> \
  --document-name AWS-StartPortForwardingSession \
  --parameters '{"portNumber":["3389"],"localPortNumber":["13389"]}' \
  --region <region> \
  --profile <profile>
```

> **Note:** This command window **must remain open and running** to keep the secure tunnel active. This establishes the vital connection through the AWS console and agent, **bypassing any VPN or network issues**.

### Step 2: Connect via RDP Client

While the tunnel is running, open your standard Remote Desktop client and connect using your local tunnel endpoint.

| Field | Value |
| :--- | :--- |
| **Computer/Host** | `localhost:13389` |
| **Credentials** | Your authentication credentials. |

-----

## 3\. Connecting to Multiple Servers 🖥️

To connect to several EC2 instances simultaneously, you must start a separate SSM Port Forwarding session for each instance, assigning a **unique local port** for every session.

| Instance | Target ID | Local Port | Command Example |
| :--- | :--- | :--- | :--- |
| **Server 1** | `<InstanceID1>` | `13389` | `aws ssm start-session --target <InstanceID1> --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["3389"],"localPortNumber":["13389"]}' --region <region> --profile <profile>` |
| **Server 2** | `<InstanceID2>` | `13390` | `aws ssm start-session --target <InstanceID2> --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["3389"],"localPortNumber":["13390"]}' --region <region> --profile <profile>` |

> **Remember:** Each port forwarding session must be **kept active** in its own separate terminal window. You will connect your RDP client to `localhost:<localPortNumber>` (e.g., `localhost:13390` for Server 2).

-----

This procedure provides a vital **contingency plan** for access and management.

## Facing Similar Infrastructure Challenges?

At ZSoftly, we understand the critical importance of maintaining secure and reliable access to your cloud infrastructure. Our team of certified DevOps and AWS experts specializes in implementing robust solutions that ensure your systems remain operational, even during unexpected outages.

Whether you need help with AWS SSM configurations, VPN alternatives, or comprehensive cloud security strategies, we provide tailored services to keep your business running smoothly.

**Ready to strengthen your infrastructure resilience?** Contact ZSoftly today for a free consultation and discover how our professional DevOps and cloud services can protect your operations.

- **Email:** info@zsoftly.com
- **Phone:** +1 (343) 503-0513
- **Website:** [zsoftly.com](https://zsoftly.com)