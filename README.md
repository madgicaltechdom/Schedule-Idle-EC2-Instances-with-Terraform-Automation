# EC2 Machine Scheduling using Terraform
This repository contains the necessary files and instructions for scheduling EC2 machines using Terraform. With this solution, you'll be able to schedule the start and stop of your instances based on your business needs.

I took information from this [article](https://dnx.solutions/reducing-aws-costs-by-turning-off-development-environments-at-night-the-easy-way-without-lambda/) and this is [video](https://t43312857.p.clickup-attachments.com/t43312857/37a20fb7-f878-486f-9bb3-0ae66e34b169/Multi-Machine-Scheduling-kaumudi.mp4) for  implementation.

## Requirements
 - Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
 - An AWS account with permissions to work with EC2 instances and AutoScaling Group.
 - Create IAM user with programmatic access and administrator Access [video](https://www.youtube.com/watch?v=Xx_-IA9qnuI)
## Usage
1. Clone this repository to your local machine:

    ```
    git clone https://github.com/kaumudi766/Multi_Machine_Schedule
    ```
2. Navigate to the repository directory:
    ```
   cd Multi_Machine_Schedule
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
11. Create a new workspace for each environment you want to deploy, for example for qa (testing):      
    ```
     terraform workspace new qa 
     ```


# Verify Machines Status
1. Click on the link below  to see status 

 https://us-east-2.console.aws.amazon.com/cloudwatch/home?region=us-east-2#rules:

![Screenshot (164) (1)](https://user-images.githubusercontent.com/109335469/213730422-0e4803f2-4fc8-45ba-bfe0-0cad41313a79.png) 



![Screenshot (163) (1)](https://user-images.githubusercontent.com/109335469/213730110-2867fbf6-71a8-4758-b099-eafd87d66010.png) 



![Screenshot (165) (1)](https://user-images.githubusercontent.com/109335469/213731007-5f9390a6-8557-4946-b307-d1d02a14b5d5.png)



2. Check The Execution Point Using System Manager by clicking on the link below: 

https://us-east-2.console.aws.amazon.com/systems-manager/automation/executions?region=us-east-2

<img width="906" alt="Screenshot (166)" src="https://user-images.githubusercontent.com/109335469/213734723-5a2d5503-472f-48d2-b827-c9225e2ba14f.png">



