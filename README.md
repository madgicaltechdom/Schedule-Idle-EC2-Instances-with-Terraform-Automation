# Multi_Machine_Schedule
# Turn-off-and-on-EC2 machine
I took information from this [article](https://dnx.solutions/reducing-aws-costs-by-turning-off-development-environments-at-night-the-easy-way-without-lambda/)
and apply terraform through this [article](https://github.com/DNXLabs/terraform-aws-rds-scheduler) and code is explained in this [video](https://shorthillstech-my.sharepoint.com/personal/kapil_jain_shorthillstech_com/_layouts/15/onedrive.aspx?ga=1&id=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects%2Fmachine%20scheduling%5Fkaumudi%2Emp4&parent=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects) and timing is explained in this  [video2](https://shorthillstech-my.sharepoint.com/personal/kapil_jain_shorthillstech_com/_layouts/15/onedrive.aspx?ga=1&id=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects%2Fmachine%5Fschedule%5Fkaumudi%2Emp4&parent=%2Fpersonal%2Fkapil%5Fjain%5Fshorthillstech%5Fcom%2FDocuments%2FTraining%2FDevOps%2FProjects)
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

