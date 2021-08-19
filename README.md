# atmark-infra

![Lint Status](https://github.com/gotoeveryone/atmark-infra/workflows/Lint/badge.svg)

## Requirements

- [Terraform CLI](https://www.terraform.io/docs/cli-index.html)
- [Pipenv](https://pipenv-ja.readthedocs.io/ja/translate-ja/)

## Setup

### Terraform

```console
$ cd {repository_root}/terraform
$ cp terraform.tfvars.example terraform.tfvars # please edit values
$
$ terraform plan
$ terraform apply
```

### Ansible

```console
$ cd {repository_root}/ansible
$ cp hosts.example hosts # please edit values
$ cp vars/user.yml.example vars/user.yml # please edit values
$ cp vars/mysql.yml.example vars/mysql.yml # please edit values
$
$ pipenv install
$ pipenv run install
$ pipenv run setup_certificate -u {user_name} --private-key {private_key_path}
$ pipenv run setup -u {user_name} --private-key {private_key_path}
```
