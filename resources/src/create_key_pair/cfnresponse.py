import json

from urllib.request import build_opener, HTTPHandler, Request

SUCCESS = "SUCCESS"
FAILED = "FAILED"


def send(event, context, response_status, reason=None, response_data=None, physical_resource_id=None):
    """ Send response from CloudFormation Lambda """
    response_data = response_data or {}
    response_body = json.dumps(
        {
            'Status': response_status,
            'Reason': reason or "See the details in CloudWatch Log Stream: " + context.log_stream_name,
            'PhysicalResourceId': physical_resource_id or context.log_stream_name,
            'StackId': event['StackId'],
            'RequestId': event['RequestId'],
            'LogicalResourceId': event['LogicalResourceId'],
            'Data': response_data
        }
    )

    data_as_bytes = response_body.encode('utf-8')
    opener = build_opener(HTTPHandler)
    request = Request(event['ResponseURL'], data=data_as_bytes)
    request.add_header('Content-Type', '')
    request.add_header('Content-Length', len(data_as_bytes))
    request.get_method = lambda: 'PUT'
    try:
        print("Calling URL {}".format(event['ResponseURL']))
        response = opener.open(request)
        print("Status code: {}".format(response.getcode()))
        print("Status message: {}".format(response.msg))
    except Exception as exc:
        print("Failed executing HTTP request: {}".format(exc))
        raise exc
