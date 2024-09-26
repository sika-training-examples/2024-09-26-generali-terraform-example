module "foo_storage" {
  source = "git::https://github.com/sika-training-examples/2024-09-26-generali-terraform-modules-example.git//modules/storage"

  name        = "generaliexamplefoo"
  location    = local.WESTEUROPE
  tags_common = local.tags_common
}
