import boto3

KEY_NAME = "linux_servers_ssh_key"


def get_ssh_pem(AWS_REGION, sts_session):
    """ Return parameter from SSM Parameter Store"""
    ssm_client = sts_session.client("ssm")
    ssh_key = ssm_client.get_parameter(Name=KEY_NAME)['Parameter']['Value']
    return ssh_key


def lambda_handler(event, context):
    """ Get SSM parameter and return it in HTTP-ready response """
    session = boto3.session.Session()

    return {
        "statusCode": 200,
        "body": get_ssh_pem('us-east-1', session),
        "headers": {"content-type": "text/plain"}
    }
