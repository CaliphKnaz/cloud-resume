resource "aws_dynamodb_table" "visitorCount" {
    name = "visitorCount"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "counter"
    
    attribute {
      name = "counter"
      type = "N"
    }
  
  }

output "count_table" {
  value = aws_dynamodb_table.visitorCount
}