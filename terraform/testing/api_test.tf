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

 

 
resource "web_test" "test" {
    provider=catchpoint
    division_id=8098
    product_id=25331
    test_name="catchpointsheldonTf"
    test_url="https://www.catchpoint.com"
    enable_test_data_webhook=true
    end_time="2025-02-20T04:59:00Z"
}
  request_settings {
        authentication {
          authentication_type = "basic"
          password_ids = [2332]
        }
        token_ids = [1096]
        http_request_headers {
          user_agent {
            value = "vikash"
          }
        }
      }

      schedule_settings{
      frequency="6 hours"
      node_distribution ="random"
      no_of_subset_nodes = 5
      node_ids =[6388]
      node_group_ids =[9922,9848]
    }
}
