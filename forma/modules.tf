module "vpc" {
  source         = "./modules/vpc"
  cluster_name   = "${var.cluster_name}"
  alb_port       = "${var.alb_port}"
  container_port = "${var.container_port}"
}

module "ecs" {
  source              = "./modules/ecs"
  vpc_id              = "${module.vpc.vpc_id}"
  cluster_name        = "${var.cluster_name}"
  container_name      = "${var.container_name}"
  container_name_wather      = "${var.container_name_wather}"

  public_subnet_1a    = "${module.vpc.public_subnet_1a}"
  public_subnet_1b    = "${module.vpc.public_subnet_1b}"
  app_sg_id           = "${module.vpc.app_sg_id}"
  alb_sg_id           = "${module.vpc.alb_sg_id}"
  ecs_sg_id           = "${module.vpc.ecs_sg_id}"
  app_repository_name = "${var.app_repository_name}"
  alb_port            = "${var.alb_port}"
  container_port      = "${var.container_port}"
  desired_tasks       = "${var.desired_tasks}"
  desired_task_cpu    = "${var.desired_task_cpu}"
  desired_task_memory = "${var.desired_task_memory}"

  security_groups_ids = [
    "${module.vpc.app_sg_id}",
    "${module.vpc.alb_sg_id}",
    "${module.vpc.ecs_sg_id}",
  ]

  availability_zones = [
    "${module.vpc.public_subnet_1a}",
    "${module.vpc.public_subnet_1b}",
  ]
}

#// module "pipeline" {
#//   source                = "./modules/pipeline"
#//   cluster_name          = "${var.cluster_name}"
#//   container_name        = "${var.container_name}"
#//   app_repository_name   = "${var.app_repository_name}"
#//   git_repository_owner  = "${var.git_repository_owner}"
#//   git_repository_name   = "${var.git_repository_name}"
#//   git_repository_branch = "${var.git_repository_branch}"
#//   repository_url        = "${module.ecs.repository_url}"
#//   app_service_name      = "${module.ecs.service_name}"
#//   vpc_id                = "${module.vpc.vpc_id}"
#//   region                = "${var.aws_region}"

#//   subnet_ids = [
#//     "${module.vpc.public_subnet_1a}",
#//     "${module.vpc.public_subnet_1b}",
#//   ]
#// }
