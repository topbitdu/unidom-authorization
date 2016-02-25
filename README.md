# Unidom Authorization 授权领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-authorization.svg)](https://badge.fury.io/rb/unidom-authorization)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Authorization domain model engine includes the Permission and Authorizing models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。授权领域模型引擎包括权限、授权的模型。

## Usage in Gemfile
```ruby
gem 'unidom-authorization'
```

## Run the Database Migration
```shell
rake db:migrate
```

## Call the Model
```ruby
Unidom::Authorization::Permission.valid_at.alive
Unidom::Authorization::Authorizing.valid_at.alive
```
