# Lab 01 - OpenStack Infrastructure  

## Objective  

The primary objective of **Lab 01 - OpenStack Web UI** is to learn how to **deploy and configure a virtual infrastructure on OpenStack** using the web interface provided by UIT Cloud.  
Through this lab, students become familiar with key OpenStack components such as **Networks, Routers, Instances, Keypairs, Security Groups, and Floating IPs**, and learn how to manage them visually via the Horizon dashboard.

In this lab, we will:  

1. Create a **local network** (`nhomXX_local`) and multiple **subnets** (`nhomXX_net01`, `nhomXX_net02`, `nhomXX_net03`).  
2. Create and configure a **router** (`nhomXX_R`) that connects internal networks to the external network.  
3. Generate an **SSH keypair** to securely access instances.  
4. Launch **four instances** (`pc0`, `pc1`, `pc2`, `pc3`) and attach them to the proper networks.  
5. Assign **Floating IPs** to the instances for external connectivity.  
6. Configure **firewall (security group)** rules to allow SSH access (port 22).  
7. Use **OpenVPN + PuTTY/SSH** to connect to instances and verify connectivity (ping tests).  
8. Capture screenshots, routing tables, and test results for the final report.

> 💡 *Note: Terraform code included in this repository is an optional enhancement for automation, not part of the official Web UI lab requirement.*

---

## Infrastructure Overview  

The lab topology consists of a **4-node virtual network** connected through one router (`nhomXX_R`) and multiple internal networks.  

![diagram](images/diagram.png)

Each instance is connected to its assigned subnet, and routing is enabled through the main router.  
Later, additional configuration with `cloud-init` or Quagga/RIP can be applied to automate IP and routing setup.

---

## Terraform Supplement  

Although not required in the official lab, this repository includes a **Terraform configuration** that automates the same steps for learning purposes.  
It defines all resources—networks, routers, instances, and security rules—following Infrastructure as Code (IaC) principles.

---
