# Firewall CI/CD change workflow

Testing CI/CD principals with firewall changes and maybe some AI.

Hypothesis: CI/CD appliance firewall changes for the least cost with event driven architecture.

Ingedients:
* Terraform for infrastructure build
* Ansible for config management (Most firewalls work with it and python)
* Ec2 for ansible control node - hoping to move to a container or function
    * Could this be Ipv6 only.
* SSM for:
    * Applying intial playbook for control node.
    * Parameter store 
* KMS, S3, dynamodb, CloudWatch, Cloudtrail for tf backend and operations.

Workflow:
1. create a feature request with 5 tuple requirement
2. CodeWhisperer to create code and recommend objects/groups
3. create branch for change
4. add ansible/terraform code
5. Create a PR
    1. lint/syntax check
    2. security scan code
8. merge change if approved
9. trigger control node to get new configuration to roll out to firewall.

## Phase 2
turn the control node into a lambda function or fargate container and start on merge commit event.
OR
Use spot instances and ASG change the instance size from 0 to 1

## Phase 3
Automatic ssh keys retieval 
