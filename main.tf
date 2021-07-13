resource "tfe_workspace" "test" {
  name         = "create-notification-configuration-from-another-workspace"
  organization = tfe_organization.test.id
}


resource "tfe_notification_configuration" "test" {
  name             = "my-test-email-notification-configuration"
  enabled          = true
  destination_type = "email"
  triggers         = ["run:created", "run:planning", "run:errored"]
  workspace_id     = tfe_workspace.test.id
}
