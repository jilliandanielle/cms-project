resource "aws_cloudwatch_metric_alarm" "rds_cpu_alarm" {
  alarm_name          = "rds-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 2
  metric_name        = "CPUUtilization"
  namespace          = "AWS/RDS"
  period             = 300 # 5 minutes
  statistic          = "Average"
  threshold           = 90 # 90% CPU utilization

  alarm_description = "Alarm if RDS CPU usage exceeds 90% for 2 consecutive 5-minute periods."
  alarm_actions     = [aws_sns_topic.my_sns_topic.arn]

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.my_db_instance.id
  }
}

resource "aws_sns_topic" "my_sns_topic" {
  name = "my-sns-topic"
}

resource "aws_db_instance" "my_db_instance" {
  # Your RDS instance configuration here
  # ...
}

# Additional resources and configurations for your infrastructure...
