################################
###### QUICK EDIT'S HERE  ######
################################

###### CLUSTER OPTIONS  ######

# Customize the Cluster Name
variable "cluster_name" {
  description = "ECS Cluster Name"
  default     = "web-app"
}

# Customize your ECR Registry Name
variable "app_repository_name" {
  description = "ECR Repository Name"
  default     = "web-app"
}

variable "app_repo_whater" {
  description = "ECR Repository Name"
  default     = "web-wather"
}

###### APPLICATION OPTIONS  ######
variable "container_name" {
  description = "Container app name"
  default     = "micro-api"
}

variable "container_name_wather" {
  description = "Container app name"
  default     = "wather-api"
}

# Number of containers
variable "desired_tasks" {
  description = "Number of containers desired to run app task"
  default     = 2
}

# Desired CPU
variable "desired_task_cpu" {
  description = "Desired CPU to run your tasks"
  default     = "256"
}

# Desired Memory
variable "desired_task_memory" {
  description = "Desired memory to run your tasks"
  default     = "512"
}

# Listener Application Load Balancer Port
variable "alb_port" {
  description = "Origin Application Load Balancer Port"
  default     = "80"
}

# Target Group Load Balancer Port
variable "container_port" {
  description = "Destination Application Load Balancer Port"
  default     = "80"
}

// ###### GITHUB OPTIONS  ######

// # Github Repository Owner
// variable "git_repository_owner" {
//   description = "Github Repository Owner"
//   default     = "msfidelis"
// }

// # Github Repository Project Name
// variable "git_repository_name" {
//   description = "Project name on Github"
//   default     = "micro-api"
// }

// # Default Branch
// variable "git_repository_branch" {
//   description = "Github Project Branch"
//   default     = "master"
// }

# Customize your AWS Region
variable "aws_region" {
  description = "AWS Region for the VPC"
  default     = "us-east-1"
}


### Forma variables

variable "name" {
  description = "The name for the resource"
  default = "example"
}
variable "environment" {
  description = "The env of the app"
  default = "staging"
}