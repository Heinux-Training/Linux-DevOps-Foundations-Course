## How to use Cloudwatch agent to send custom metrics and logs to CloudWatch

### Step 1: Create IAM Role (for EC2)

Create an IAM role with these policies:

CloudWatchAgentServerPolicy (AWS managed policy)

### Step 2: Install the CloudWatch Agent

Ubuntu
``` bash
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
```

### Step 3: Create Configuration File

Create /opt/aws/amazon-cloudwatch-agent/etc/config.json:

``` bash
{
  "agent": {
    "metrics_collection_interval": 60,
    "run_as_user": "root"
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/dmesg",
            "log_group_name": "/aws/ec2/system-logs",
            "log_stream_name": "{instance_id}"
          },
          {
            "file_path": "/var/log/app.log",
            "log_group_name": "/aws/ec2/app-logs",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  },
  "metrics": {
    "namespace": "CustomMetrics",
    "metrics_collected": {
      "disk": {
        "measurement": [
          {
            "name": "used_percent",
            "rename": "DISK_USED",
            "unit": "Percent"
          }
        ],
        "metrics_collection_interval": 60,
        "resources": [
          "*"
        ]
      },
      "mem": {
        "measurement": [
          {
            "name": "mem_used_percent",
            "rename": "MEM_USED",
            "unit": "Percent"
          }
        ],
        "metrics_collection_interval": 60
      }
    }
  }
}
```

### Step 4: Change Log file path

Change the log file path appropirately in your config file.

### Step 5: Start the agent

```
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -s \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/config.json
```

### Step 6: Verify agent is running

``` bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -m ec2 \
  -a status
```
### Step 7: Common management commands

``` bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a stop

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start

sudo tail -f /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log
```

### Optional Tip: Redirect docker container logs to one location

``` bash
docker logs -f <container-name> > /var/log/python-web.log 2>&1 &
```