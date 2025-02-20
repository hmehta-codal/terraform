module "lambda-dev" {
  source               = "../../../module/lambda"
  function_name        = "lambda-dev"
  function_source_path = abspath("${path.module}/../../../env/dev/lambda/lambda_demo/lambda.zip")
}
