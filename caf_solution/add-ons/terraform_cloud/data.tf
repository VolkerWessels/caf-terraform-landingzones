data "tfe_organization" "existing" {
  name = var.tfe_existing_organization_name
}

data "tfe_team" "existing" {
  name         = var.tfe_existing_team_name
  organization = tfe_organization.existing
}
