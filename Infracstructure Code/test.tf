resource "local_file" "test" {
  filename = "attempt"
  content = "this is a test of terraform"
}