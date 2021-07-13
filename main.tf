resource "tfe_organization" "test" {
  name  = "nikolay-paid"
  email = "nikolay@hashicorp.com"
}

resource "tfe_workspace" "test" {
  name         = "create-notification-configuration-from-another-workspace"
  organization = tfe_organization.test.id
}


resource "tfe_notification_configuration" "test" {
  name             = "my-test-email-notification-configuration"
  enabled          = true
  destination_type = "nikolay@hashicorp.com"
  email_user_ids   = [tfe_organization_membership.test.user_id]
  triggers         = ["run:created", "run:planning", "run:errored"]
  workspace_id     = tfe_workspace.test.id
}
