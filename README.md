# EC2 Machine Scheduling using Terraform
This repository contains the necessary files and instructions for scheduling EC2 machines using Terraform. With this solution, you'll be able to schedule the start and stop of your instances based on your business needs.

 These are two videos :
 1. step Implementation [video](https://drive.google.com/file/d/1zTsWASfrs24O1K8K5QWnbp5VNlA7xTdI/view?usp=sharing) and 
 2. Live process [video](https://drive.google.com/file/d/1Zs0K5jZo8RS6i1lvsxdym3m9Nf44xNps/view?usp=sharing)  for  implementation.

## Requirements
 - Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
 -  Setup your AWS account [video](https://www.youtube.com/watch?v=XhW17g73fvY&t=357s)
 - Create a programmatic user with the permissions specified in the [permission.json](https://github.com/kaumudi766/Multi_Machine_Schedule/blob/main/permission.json) file
 - We must have running machines/instances which we want to Schedule.
 
 ## Here is an example of a cron job that runs a script:-
  This cron job is made up of several fields, each separated by a space:

- The first field is for minutes (0-59)
- The second field is for hours (0-23)
- The third field is for days of the month (1-31)
- The fourth field is for months (1-12)
- The fifth field is for days of the week (0-7, where both 0 and 7 represent Sunday)
- The sixth field is for year
 
## Usage
1. Clone this repository to your local machine:

    ```
    git clone https://github.com/kaumudi766/Multi_Machine_Schedule
    ```
2. Navigate to the repository directory:
    ```
   cd Multi_Machine_Schedule
    ```
3. Change the instances array  value in the file variable.tf to meet your requirements.Give your instance id in "source_instances_map" variable in specific array for example qa array, which you want to add  for scheduling.
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
4. Change the  stopping time  value in the file variable.tf to meet your requirements.Here "30 14' is UTC time which means 9pm in IST for timing you can watch chat which i pasted last page of this file.Also machine is stopped at 9pm  from Monday to Saturday,according to your requirements you can set your days. 
    ```
    variable "cron_stop" {
        description = "Cron expression to define when to trigger a stop of the DB"
        default     = "30 14 ? * MON-SAT *"
    }
   ```
 5. Change  starting time  value in the file variable.tf to meet your requirements.Here "30 03" is UTC time which means 9am morning in IST for timing you can watch chat which i pasted last page of this file.Also machine is started at 9am from Monday to Saturday,according to your requirement you can set your days.
    ```
    variable "cron_start" {
        description = "Cron expression to define when to trigger a start of the DB"
        default     = "30 03 ? * MON-SAT *"
     }
    ```
6. Change the AWS access key value in the file variable.tf to meet your requirements.
    ```
    variable "access_key" {
        description = "value of access key"
        default     = ""
    }
     ```

7. Change the AWS secret key value in the file variable.tf to meet your   requirements.
    
    ``` 
    variable "secret_key" {
        description = "value of secret key"
        default     = ""
    }
   ```
8. Create a new workspace for each environment you want to deploy, for example for qa (testing): 
    ```
    terraform workspace new qa 
     ```
 
9. Initialize Terraform by running:
    ```
   terraform init
   ```
10. Run Terraform plan to preview the changes:
    ```
    terraform plan
    ```
11. Apply the changes
    ```
    terraform apply
    ```
   
   


# Verify Machines Status
1. Click on the link below to see status,Also you can see the time slot by implementing 5 minute later and run the code to see it's running or stopped status as shown below: 

    https://us-east-2.console.aws.amazon.com/cloudwatch/home?region=us-east-2#rules:

![Screenshot (164) (1)](https://user-images.githubusercontent.com/109335469/213730422-0e4803f2-4fc8-45ba-bfe0-0cad41313a79.png) 


  

<img width="812" alt="Screenshot (1631)" src="https://user-images.githubusercontent.com/109335469/214514799-3f224341-661c-4227-9c5b-0fe2887584c6.png">

![Screenshot (165) (1)](https://user-images.githubusercontent.com/109335469/214514514-c45e39d1-ade5-4adf-929a-e001af5a88da.jpg)





2. Check The Execution Point Using System Manager by clicking on the link below: 

https://us-east-2.console.aws.amazon.com/systems-manager/automation/executions?region=us-east-2

<img width="906" alt="Screenshot (166)" src="https://user-images.githubusercontent.com/109335469/213734723-5a2d5503-472f-48d2-b827-c9225e2ba14f.png">

I took information from this [article](https://dnx.solutions/reducing-aws-costs-by-turning-off-development-environments-at-night-the-easy-way-without-lambda/) and these are [video1](https://t43312857.p.clickup-attachments.com/t43312857/37a20fb7-f878-486f-9bb3-0ae66e34b169/Multi-Machine-Scheduling-kaumudi.mp4) and [video2](https://drive.google.com/drive/folders/1NUTGQu2hobc5figWs2vMgVgdtjh-_uOu) for  implementation.

- Here is time Zone converter for IST to UTC :

![web-screenshot-25-01-2023 (4)](https://user-images.githubusercontent.com/109335469/214537941-37ab6022-d49a-4e50-8d27-623c77007e05.jpg)


