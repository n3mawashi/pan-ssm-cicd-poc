# Firewall CI/CD change workflow

Testing CI/CD principals with firewall changes and maybe some AI.

#### Hypothesis: CI/CD appliance firewall changes for the least cost with event driven architecture.

## Ingedients:
* Terraform for infrastructure build
* Ansible for config management (Most firewalls work with it and python)
* Ec2 for ansible control node - hoping to move to a container or function
  * Could this be Ipv6 only.
  * github's tf provider does have a data resource for aciton IP addresses in CIDR range.
* SSM for:
  * Applying intial playbook for control node.
  * Parameter store for secrets
* KMS, S3, dynamodb, CloudWatch, Cloudtrail for tf backend and operations.

## Workflow:

### Bug
1. Create a simple or complex issue
  1. Use custom template still but with source/destination/port.
  2. Use customer template for complex bugs to capture more details around applications (think AD)
2. Issue triggers a AWS/firewall reachability tests
  1. AWS could be triggered from github <-> SNS queue
  2. Firewall is likely to need a ansible playbook 
3. Reports back both tests into the issue
4. Add a label if tests comeback green for engineer to asses next steps.

### Firewall change
1. Create feature request with 5 tuple/URL requirement in description
2. create branch for change
3. add ansible/terraform code
  1. Could use NLP/AI to recomemend code with some awareness of objects and groups (think AD)
4. Create a PR
  1. lint/syntax check
  2. security scan code
5. merge change if approved
6. trigger control node to get new configuration to roll out to firewall.
7. Run reachability test to confirm change is sucessful.

## Phase 2
turn the control node into a lambda function or fargate container and start on merge commit event.
OR
Use spot instances and ASG change the instance size from 0 to 1

## Phase 3
Automatic ssh keys retieval from gpg
