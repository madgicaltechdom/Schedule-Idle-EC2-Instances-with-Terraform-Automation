resource "aws_cloudwatch_event_rule" "EC2_stop" {
  count               = var.enable ? 1 : 0
  name                = "EC2-scheduler-${local.identifier}-stop"
  description         = "Stops EC2 instance on a schedule"
  schedule_expression = "cron(${var.cron_stop})"
}

data "aws_instances" "instances" {
  instance_tags = {
    environment = "qa"
  }
  instance_state_names = ["running", "stopped"]
}

resource "aws_cloudwatch_event_target" "EC2_stop" {
  count = var.enable ? 1 : 0
  arn   = "arn:aws:ssm:${data.aws_region.current.name}::automation-definition/AWS-StopEC2Instance:$DEFAULT"
  input = jsonencode(
    {
      AutomationAssumeRole = [
        aws_iam_role.ssm_automation[0].arn,
      ]
      InstanceId = data.aws_instances.instances.ids
    }
  )
  role_arn  = aws_iam_role.event[0].arn
  rule      = aws_cloudwatch_event_rule.EC2_stop[0].name
  target_id = "EC2-scheduler-${local.identifier}-stop"
}

resource "aws_cloudwatch_event_rule" "EC2_start" {
  count               = var.enable ? 1 : 0
  name                = "EC2-scheduler-${local.identifier}-start"
  description         = "Starts EC2 instance on a schedule"
  schedule_expression = "cron(${var.cron_start})"
}

resource "aws_cloudwatch_event_target" "EC2_start" {
  count = var.enable ? 1 : 0
  arn   = "arn:aws:ssm:${data.aws_region.current.name}::automation-definition/AWS-StartEC2Instance:$DEFAULT"
  input = jsonencode(
    {
      AutomationAssumeRole = [
        aws_iam_role.ssm_automation[0].arn,
      ]
      InstanceId = data.aws_instances.instances.ids
    }
  )
  role_arn  = aws_iam_role.event[0].arn
  rule      = aws_cloudwatch_event_rule.EC2_start[0].name
  target_id = "EC2-scheduler-${local.identifier}-start"
}
