# EC2 Machine Scheduling using Terraform
This repository contains the necessary files and instructions for scheduling EC2 machines using Terraform. With this solution, you'll be able to schedule the start and stop of your instances based on your business needs.

 These are two videos :
 1. Step by Step User Guide   [video](https://drive.google.com/file/d/1zTsWASfrs24O1K8K5QWnbp5VNlA7xTdI/view?usp=sharing).
 2. Live Process [video](https://drive.google.com/file/d/1Zs0K5jZo8RS6i1lvsxdym3m9Nf44xNps/view?usp=sharing)  for  implementation.

## Requirements
 - Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
 -  Setup your AWS account [video](https://www.youtube.com/watch?v=XhW17g73fvY&t=357s)
 - Create a programmatic user with the permissions specified in the [permission.json](https://github.com/kaumudi766/Multi_Machine_Schedule/blob/main/permission.json) file
 - We must have running machines/instances which we want to Schedule.
 
 ## Cronjob Fundamentals:
  This cron job is made up of several fields, each separated by a space:
 ``` 
[Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week] 
```
- The first field is for minutes (0-59)
- The second field is for hours (0-23)
- The third field is for days of the month (1-31)
- The fourth field is for months (1-12)
- The fifth field is for days of the week (0-7, where both 0 and 7 represent Sunday)
- The sixth field is for year by default it take current year.
 
## Usage
1. Clone this repository to your local machine:

    ```
    git clone https://github.com/kaumudi766/Multi_Machine_Schedule
    ```
2. Navigate to the repository directory:
    ```
   cd Multi_Machine_Schedule
    ```
3. To meet your needs, alter the value of the instances array in the file variable.tf. Give your instance id to the "source instances map" variable in the particular array you want to add for scheduling, for instance the qa array.
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
4. To match your requirements, modify the stopping time value in the file variable.tf. In this case, "30 14" is UTC time, which corresponds to 9 p.m. IST. For timing, please refer to the chart we printed on the last page of this file. Additionally, the machine is shut off at 9 p.m., Monday through Saturday. You can customise your days according to your needs. 
    ```
    variable "cron_stop" {
        description = "Cron expression to define when to trigger a stop of the DB"
        default     = "30 14 ? * MON-SAT *"
    }
   ```
 5. Change the starting time value in the file variable.tf to suit your needs. For timing, please refer to the chart on the last page of this file. In this case, "30 03" denotes UTC time, which corresponds to 9 a.m. IST. Additionally, the machine is turned on at 9 a.m., Monday through Saturday. You can customise your days according to your needs.
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
1. Click on the link below to see status, also you can see the time slot by implementing 5 minute later and run the code to see it's running or stopped status as shown below: 

    https://us-east-2.console.aws.amazon.com/cloudwatch/home?region=us-east-2#rules:

![Screenshot (164) (1)](https://user-images.githubusercontent.com/109335469/213730422-0e4803f2-4fc8-45ba-bfe0-0cad41313a79.png) 


  

<img width="812" alt="Screenshot (1631)" src="https://user-images.githubusercontent.com/109335469/214514799-3f224341-661c-4227-9c5b-0fe2887584c6.png">

![Screenshot (165) (1)](https://user-images.githubusercontent.com/109335469/214514514-c45e39d1-ade5-4adf-929a-e001af5a88da.jpg)





2. Check The Execution Point Using System Manager by clicking on the link below: 

https://us-east-2.console.aws.amazon.com/systems-manager/automation/executions?region=us-east-2

<img width="906" alt="Screenshot (166)" src="https://user-images.githubusercontent.com/109335469/213734723-5a2d5503-472f-48d2-b827-c9225e2ba14f.png">


## References :
We took information from this [article](https://dnx.solutions/reducing-aws-costs-by-turning-off-development-environments-at-night-the-easy-way-without-lambda/) and  these are two videos :
 1. Step by Step User Guide  [video](https://drive.google.com/file/d/1zTsWASfrs24O1K8K5QWnbp5VNlA7xTdI/view?usp=sharing).
 2. Live Process [video](https://drive.google.com/file/d/1Zs0K5jZo8RS6i1lvsxdym3m9Nf44xNps/view?usp=sharing)  for  implementation.
 3. Link for [time zone](https://www.worldtimebuddy.com/ist-to-utc-converter)

- Here is time Zone converter for IST to UTC :

![web-screenshot-25-01-2023 (4)](https://user-images.githubusercontent.com/109335469/214537941-37ab6022-d49a-4e50-8d27-623c77007e05.jpg)

# Contributing
We are very grateful for any contributions you are willing to make. Please have a look here to get started. If you aim to make a large change, it is helpful to discuss the change first in a new GitHub issue. Feel free to open one!
# LICENSE :
Copyright (c) 2023 MadgicalTechdom and contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


