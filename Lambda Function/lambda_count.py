#importing packages
import json
import boto3

#function definition
    
#function definition for updating the table
def lambda_handler(event,context):
	dynamodb = boto3.resource('dynamodb')
	#table name
	
	table = dynamodb.Table('visitorCount')
	response2 = table.get_item(Key={'count': 0})
	item = response2['Item']['rate']
	if item < 1000000000:
		item += 1
		print(item)
    
	#inserting values into table
	response = table.update_item(
	    Key={
	        'count' : 0
	    },
	    #update the attribute rate
	    UpdateExpression= 'set rate = :r',
	    ExpressionAttributeValues={
	        ':r': item,
	    },
	    ReturnValues="UPDATED_NEW"

    )

	    
	return response