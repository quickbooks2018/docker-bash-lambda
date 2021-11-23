#!/bin/bash
# https://docs.aws.amazon.com/lambda/latest/dg/python-image.html
# https://gallery.ecr.aws/lambda/python
# /lambda-entrypoint.sh



aws s3api create-bucket --bucket cloudgeeksca-lambda20 --region us-east-1





aws s3api put-bucket-versioning --bucket cloudgeeksca-lambda20 --versioning-configuration Status=Enabled

# ICMP not permitted     # (this will trigger your script failed)
# ping -c3 cloudgeeks.ca      


# Stop Ec2
aws ec2 stop-instances --instance-ids i-0d88596481d3b9185




# End