# Unidom Authorization Roadmap 授权领域模型引擎路线图

## v0.1
1. Permission model & migration (20000401000000)
2. Authorizing model & migration (20000402000000)

## v0.2
1. Improve the Authorizing model to add the .``authorize!`` method
2. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improve the Authorizing model to support the Keyword Arguments

## v1.1
1. As Authorized concern
2. Improve the Permission model to add the #``authorize!`` method
3. Improve the Permission model to add the #``authorized?`` method

## v1.2
1. Improve the As Authorized concern to add the #``is_authorized!`` method & the #``is_authorized?`` method

## v1.2.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.2.2
1. Improve the As Authorized concern for argument validation
2. Improve the Permission model for argument validation

## v1.3
1. As Permission concern
2. Improve the Permission model to include the As Permission concern

## v1.4
1. Improve the Authorization migration for the #``authorizer_type`` & the #``authorized_type`` column
2. Improve the Authorizing model for the argument validation
3. Improve the As Authorized concern for the argument validation
4. Improve the As Permission model for the argument validation

## v1.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.4.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.4.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.4.4
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v1.4.5
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.5
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.6
1. Improve the As Authorized concern to add the #``is_prohibited!`` method
2. Improve the As Permission concern to add the #``prohibit!`` method

## v1.6.1
1. Improve the Authorizing spec for the permission_is scope
2. Improve the Permission spec for the path_is scope

## v1.6.2
1. Improve the Authorizing spec for the ``belongs_to :permission, class_name: 'Unidom::Authorization::Permission'`` macro

## v1.6.3
1. Improve the Permission spec for the validations on the #name attribute, & the #path attribute

## v1.6.4
1. Improve the Authorizing spec for the permission_is scope
2. Improve the Permission spec for the validations on the #name attribute, & the #path attribute

## v1.6.5
1. As Authorized shared examples
2. As Permission shared examples
3. RSpec shared examples manifest
4. Improve the Permission spec for the As Permission concern

## v1.6.6
1. Improve the As Permission concern for the argument validation
2. Improve the As Authorized shared examples for the #is_authorized! method, the #is_authorized? method, & the #is_prohibited! method
3. Improve the As Permission shared examples for the #authorize! method, the #authorize? method, & the #prohibit! method
4. Permission shared examples
