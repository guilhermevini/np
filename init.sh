#!/bin/bash

aws configure set aws_access_key_id AKIAZRLK7LSZ3DO4RYHK
aws configure set aws_secret_access_key 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
aws configure set region us-east-2

aws s3 mb s3://neon-lab-terraform --region us-east-2