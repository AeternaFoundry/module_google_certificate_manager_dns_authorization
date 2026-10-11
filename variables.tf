variable "certificate_manager_dns_authorizations" {
  description = <<EOT
Map of certificate_manager_dns_authorizations, attributes below
Required:
    - domain
    - name
Optional:
    - deletion_policy
    - description
    - labels
    - location
    - project
    - type
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    domain          = string
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    labels          = optional(map(string))
    location        = optional(string)
    project         = optional(string)
    type            = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

