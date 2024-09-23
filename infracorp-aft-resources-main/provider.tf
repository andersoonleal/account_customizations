terraform { 
  cloud { 
    
    organization = "Nuclea" 

    workspaces { 
      name = "infracorp-aft-resources" 
    } 
  } 
}
