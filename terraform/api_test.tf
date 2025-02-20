terraform {
  required_providers {
    catchpoint = {
      source  = "catchpoint/catchpoint"
      version = "1.5.0"
    }
  }
}

 

provider "catchpoint" {
api_token="B27B80758D93018D781C80A63769D84F73765B4AB6889D24B8DAC396576A2F4A"
}

 

 

resource "api_test" "test1234555" {
  test_name  = "APItest_TF_12345"
  provider=catchpoint
  division_id=8098
  product_id=24405
  test_script="// Step - 1\r\nopen(\"\\\"http://172.235.6.159:3000/health)\")"
  test_script_type="selenium"
  start_time = "2025-02-18T04:59:00Z"
  end_time="2025-12-30T04:59:00Z"
}
