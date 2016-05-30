# Authorizing 是授权。

class Unidom::Authorization::Authorizing < ActiveRecord::Base

  self.table_name = 'unidom_authorizings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :permission, class_name:  'Unidom::Authorization::Permission'
  belongs_to :authorizer, polymorphic: true
  belongs_to :authorized, polymorphic: true

  scope :permission_is, ->(permission) { where permission_id: (permission.respond_to?(:id) ? permission.id : permission) }
  scope :authorized_is, ->(authorized) { where authorized: authorized }
  scope :authorized_by, ->(authorizer) { where authorizer: authorizer }

end
