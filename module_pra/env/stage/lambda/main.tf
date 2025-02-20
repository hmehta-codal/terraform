module "lambda-dev" {
  source               = "../../../module/lambda"
  function_name        = "lambda-stage"
  function_source_path = abspath("${path.module}/../../../env/stage/lambda/lambda_demo/lambda.zip")
}
