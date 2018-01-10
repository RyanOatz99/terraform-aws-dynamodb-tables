# Terraform AWS Dynamodb Tables

This module simplifies creating dynamodb tables. The minimum information required is a name for the table, each table can then contain different values for read/write capacity.

## Example

```hcl
module "tables" {
  source     = "vistaprint/dynamodb_tables/aws"
  table_info = [
    {
      name = "${var.prefix}Table1"
    },
    {
      name = "${var.prefix}Table2"
      read_capacity = 2
      write_capacity = 2
    }
}
```
## Testing

This module uses the [tfmodtest](https://github.com/vistaprint/tfmodtest) framework. After making some changes run rake preflight from the root of the repository to run all tests for the module. This will require:

* A config file in `test\cloudfront-cloudwatch-monitors\config\config-dev.yml`
```yml
terraform-version: 0.11.0
project-name: dynamodb test tests
aws:
  profile: <profile>
  region: <region>
```
* A secrets file in `test\dynamodb_tables\secrets.yml:`
```yml
region: <region>
aws_access_key_id: <access_key_id>
aws_secret_access_key:  <secret_access_key>
```