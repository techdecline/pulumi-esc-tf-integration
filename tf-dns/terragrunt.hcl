terraform {
  after_hook "run_uv_python" {
    commands = ["apply"]
    execute = [
      "sh", "-c",
      "terraform output -json > output.json && uv run --directory ../esc-mod esc-mod --terraform-output '${get_terragrunt_dir()}/output.json'"
    ]
  }
}