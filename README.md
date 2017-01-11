# Unidom Authorization 授权领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-authorization/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-authorization.svg)](https://badge.fury.io/rb/unidom-authorization)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-authorization.svg)](https://gemnasium.com/github.com/topbitdu/unidom-authorization)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Authorization domain model engine includes the Permission and Authorizing models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。授权领域模型引擎包括权限、授权的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-authorization'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200004.



## Call the Model

```ruby
Unidom::Authorization::Permission.valid_at.alive
Unidom::Authorization::Authorizing.valid_at.alive

permission = Unidom::Authorization::Permission.valid_at.alive.first

permission.authorized? user, at: Time.now # false
Unidom::Authorization::Authorizing.authorize! permission: permission, authorized: user
# or
permission.authorize! user, by: current_user, at: Time.now
permission.authorize? user, at: Time.now # true

user.is_authorized! permission: permission, by: administrator, at: Time.now
user.is_authorized? permission: permission, at: Time.now # true
```



## Include the Concerns

```ruby
include Unidom::Authorization::Concerns::AsAuthorized
include Unidom::Authorization::Concerns::AsPermission
```

### As Authorized concern

The As Authorized concern do the following tasks for the includer automatically:
1. Define the has_many :authorizings macro as: ``has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing', as: :authorized``

2. Define the has_many :permissions macro as: ``has_many :permissions, through: :authorizings, source: :permission``

3. Define the #is_authorized! method as: ``is_authorized!(permission: nil, by: nil, at: Time.now)``

4. Define the #is_authorized? method as: ``is_authorized?(permission: nil, at: Time.now)``

### As Permission concern

The As Permission concern do the following tasks for the includer automatically:
1. Define the has_many :authorizings macro as: ``has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing'``

2. Define the #authorize! method as: ``authorize!(authorized, by: nil, at: Time.now)``

3. Define the #authorize? method as: ``authorize?(authorized, at: Time.now)``
