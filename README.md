# EC2 Machine Scheduling using Terraform
This repository contains the necessary files and instructions for scheduling EC2 machines using Terraform. With this solution, you'll be able to schedule the start and stop of your instances based on your business needs.

I took information from this [article](https://dnx.solutions/reducing-aws-costs-by-turning-off-development-environments-at-night-the-easy-way-without-lambda/) 

## Requirements
 - Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
 - An AWS account with permissions to work with EC2 instances and AutoScaling Groups
 - AWS CLI and credentials configured
 - Create IAM user with programmatic access and administrator Access [video](https://www.youtube.com/watch?v=Xx_-IA9qnuI)
## Usage
1. Clone this repository to your local machine:

    ```
    git clone https://github.com/username/ec2-scheduling-terraform.git
    ```
2. Navigate to the repository directory:
    ```
   cd ec2-scheduling-terraform
    ```
3. Change the instances array starting at line 13 in the file varible.tf to meet your requirements.
    ```
    variable "source_instances_map" {
   description = "A map from instances to a list of instance id"
   type        = map(any)
   default = {
   qa  = ["i-0f31364caf36906f4", "i-0d14c3b9fe0ec4f54", "i-0f0ae101cf8e3202e", "i-0d605ef016c561e57"]
    prd = []
   }
   }
      ```
4. Change the  stopping time  at line 21 in the file varible.tf to meet your requirements.
    ```
    variable "cron_stop" {
    description = "Cron expression to define when to trigger a stop of the DB"
   default     = "30 14 ? * MON-SAT *"
   }
   ```
 5. Change  starting time  at line number 26 in the file varible.tf to meet your requirements
    ```
    variable "cron_start" {
    description = "Cron expression to define when to trigger a start of the DB"
    default     = "30 03 ? * MON-SAT *"
     }
    ```
6. Change the AWS access key at line 35 in the file varible.tf to meet your requirements.
    ```
    variable "access_key" {
    description = "value of access key"
    default     = ""
   }
     ```

7. Change the AWS secret key at line 40 in the file varible.tf to meet your    requirements.
    
    ``` 
      variable "secret_key" {
        description = "value of secret key"
        default     = ""
    }
   ```
8. Initialize Terraform by running:
    ```
   terraform init
   ```
9. Run Terraform plan to preview the changes:
    ```
   terraform plan
   ```
10.  Apply the changes:
     ```
     terraform apply
        ```
11. Create terraform workspace for qa        
    ```
     terraform workspace new qa
     ```


# Verify Machines Status
1. Click on the link to see status            https://us-east-2.console.aws.amazon.com/cloudwatch/home?region=us-east-2#rules:

![Screenshot (164)](https://user-images.githubusercontent.com/109335469/213627800-67f59476-b0f5-41de-b101-baa85172fba7.png)

![Screenshot (163)](https://user-images.githubusercontent.com/109335469/213627931-83e754df-aed5-439c-be9c-91c0000290e3.png)

![Screenshot (165)](https://user-images.githubusercontent.com/109335469/213628033-f8444a0f-f991-4f25-aea7-4899526d3b3b.png)

2. Check The Execution Point Using System Manager by clicking on the link below: https://us-east-2.console.aws.amazon.com/systems-manager/automation/executions?region=us-east-2

![Screenshot (166)](https://user-images.githubusercontent.com/109335469/213628972-0fbba94e-50c8-4671-b518-6e0a38bfd413.png)


