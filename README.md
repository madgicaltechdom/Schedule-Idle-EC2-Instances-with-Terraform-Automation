# Multi-Machine-Schedule
This repository is used for non-production instances, and it is sufficiently flexible to enable us to switch among different numbers of machines by changing a variable instance id.
# Turn-off-and-on-EC2 machine
I took information from this [article](https://dnx.solutions/reducing-aws-costs-by-turning-off-development-environments-at-night-the-easy-way-without-lambda/)
and apply terraform through this [article](https://github.com/DNXLabs/terraform-aws-rds-scheduler) and code is explained in this [video](https://shorthillstech-my.sharepoint.com/personal/kapil_jain_shorthillstech_com/_layouts/15/onedrive.aspx?ga=1&id=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects%2Fmachine%20scheduling%5Fkaumudi%2Emp4&parent=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects) and timing is explained in this  [video2](https://shorthillstech-my.sharepoint.com/personal/kapil_jain_shorthillstech_com/_layouts/15/onedrive.aspx?ga=1&id=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects%2Fmachine%5Fschedule%5Fkaumudi%2Emp4&parent=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects)

>Prerequirement:-

- Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
- Setup your AWS account [video](https://www.youtube.com/watch?v=XhW17g73fvY&t=357s)
- Create IAM user with programmatic access and administrator Access [video](https://www.youtube.com/watch?v=Xx_-IA9qnuI)

## Terraform-aws-EC2-scheduler
This is a module to create a schedule to shut down or start a Resource instance (EC2).
The following resources will be created:
- AWS Cloudwatch event rule - Delivers a real-time stream of system events that shut down or start the EC2.
- Identity Access Management (IAM) that create a service role for Systems Manager Automation.


# Inputs


| NAME | Description  | Type|  Default| Required | 
|---------| ------------------| --- | ------- | --- | 
| cron_start |Cron expression to define when to trigger a start of the EC2 | any | n/a| yes | 
|------- | --- | --- | ------- | --- | 
| cron_stop|Cron expression to define when to trigger a stop of the EC2  | any | n/a | yes| 
|------- | --- | --- | ------- | --- | 
| Identifier | EC2 instance or Aurora Cluster identifier for schedule| any | n/a| yes | 
|------- | --- | --- | ------- | --- |

# Steps to Add or Modify a Machine:

1.Define Workspaces and instance_id in workspaces which you want to schedule,Also you can change the instance_id whenever you want to do so.

![Screenshot (161)](https://user-images.githubusercontent.com/109335469/213354284-50457df7-4cc9-4d39-8117-bb1f311b2687.png)

2. Define the schedule or Timing in which you want to Run the Machine according to your requirements.

![Screenshot (162)](https://user-images.githubusercontent.com/109335469/213355251-47f9e505-9082-4d35-9b16-8a8e25b052fe.png)


# Step for event start and stop
1.start EC2:- "aws_cloudwatch_event_rule" 

![Screenshot (53)](https://user-images.githubusercontent.com/109335469/206841454-6b82212a-943b-4443-a902-5ea3c9914d57.png)

2.Stop EC2:-"aws_cloudwatch_event_rule" 

![Screenshot (54)](https://user-images.githubusercontent.com/109335469/206841471-c8cc2702-df32-41ce-bef4-7a1261e87f4e.png)

# Step for role policy:-
1.Roles policy event: "aws_iam_policy_document"

![Screenshot (55)](https://user-images.githubusercontent.com/109335469/206841630-4538c95a-ece3-476e-80f8-36d0d32f8bef.png)

2.Role policy_trust event:aws_iam_policy_document

![Screenshot (56)](https://user-images.githubusercontent.com/109335469/206841665-92edf001-98ff-4fd2-9e49-a7a24bb56f6c.png)

3.EC2 scheduling
![Screenshot (57)](https://user-images.githubusercontent.com/109335469/206841697-19111d15-58b4-4bbb-93c0-c83ca1354530.png)

![Screenshot (58)](https://user-images.githubusercontent.com/109335469/206842572-07abc5bd-f606-4c23-afff-8acd082f7278.png)

![Screenshot (59)](https://user-images.githubusercontent.com/109335469/206842583-8c7c9880-1eec-4a7b-b03e-12989d3394dd.png)


## Exact permissions we required are:-

      {
      
  "Version": "2012-10-17",
  
  "Statement": [
  
    {
    
      "Effect": "Allow",
      
      "Action": [
      
        "ec2:StartInstances",
        
        "ec2:StopInstances",
        
        "ec2:DescribeInstances"
      ],
      
      "Resource": [
        "*"
      ]
    }
  ]
}

