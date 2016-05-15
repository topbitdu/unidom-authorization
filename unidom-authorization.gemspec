$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/authorization/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-authorization'
  spec.version     = Unidom::Authorization::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-authorization'
  spec.summary     = 'Unidom Authorization Domain Model Engine 授权领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Authorization domain model engine includes the Permission and Authorizing models. Unidom (统一领域对象模型)是一系列的领域模型引擎。授权领域模型引擎包括权限、授权的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '~> 0.9'

end
