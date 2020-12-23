variable "instance_name" {
  description = "Redis instances name"
  default     = "redis"
  type        = string
}

variable "tier" {
  description = "The service tier of the instance. Must be one of these values: BASIC, STANDARD_HA"
  default     = "BASIC"
  type        = string
}

variable "memory_size_gb" {
  description = "Redis memory size in GiB"
  default     = 1
  type        = number
}

variable "network" {
  description = "Authorized network allowed to communicate with redis instance"
  type        = string
}

variable "redis_version" {
  default     = "REDIS_4_0"
  description = "Redis instance version. Must be on of these values: REDIS_5_0, REDIS_4_0, REDIS_3_2"
  type        = string
}
variable "location" {}
