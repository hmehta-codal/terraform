module "lambda-dev" {
  source = "../../../module/lambda"
  function_name = "lambda-prod"
  function_source_path = abspath("${path.module}/../../../env/prod/lambda/lambda_demo/lambda.zip")
}