terraform {
  required_providers {
    catchpoint = {
      source  = "catchpoint/catchpoint"
      version = "1.5.0"
    }
  }
}

provider "catchpoint" {
  api_token = "B27B80758D93018D781C80A63769D84F73765B4AB6889D24B8DAC396576A2F4A"
}

resource "api_test" "test67890" {
  test_name        = "APItest_TF_CICD"
  provider        = catchpoint
  division_id     = 8098
  product_id      = 24405
  test_script_type = "selenium"
  start_time      = "2025-02-18T04:59:00Z"
  end_time        = "2025-12-30T04:59:00Z"

  test_script = <<EOT
// Step 1: Check Products API
open("http://172.235.6.159:3000/products")

// Step 2: Search for 'Laptop'
open("http://172.235.6.159:3000/search?q=laptop")

// Step 3: Open cart
open("http://172.235.6.159:3000/cart")

// Step 4: Search for 'Tablet'
open("http://172.235.6.159:3000/search?q=tablet")

EOT
}


