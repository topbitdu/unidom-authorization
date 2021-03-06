##
# Authorizing 是授权。

class Unidom::Authorization::Authorizing < Unidom::Authorization::ApplicationRecord

  self.table_name = 'unidom_authorizings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :permission, class_name:  'Unidom::Authorization::Permission'
  belongs_to :authorizer, polymorphic: true
  belongs_to :authorized, polymorphic: true

  scope :permission_is, ->(permission) { where permission_id: to_id(permission) }
  scope :authorized_is, ->(authorized) { where authorized:    authorized }
  scope :authorized_by, ->(authorizer) { where authorizer:    authorizer }

  ##
  # 授予 authorized 权限 permission ，授权者是 authorizer ，授权时间是 opened_at。如：
  # Unidom::Authorization::Authorizing.authorize! permission: permission,
  #   authorized: selected_person, authorizer: current_person
  def self.authorize!(permission: nil, authorized: nil, authorizer: nil, opened_at: Time.now)

    assert_present! :permission, permission
    assert_present! :authorized, authorized
    assert_present! :opened_at,  opened_at

    attributes = { opened_at: opened_at }
    if authorizer.present?
      attributes[:authorizer] = authorizer
    else
      attributes[:authorizer_id]   = Unidom::Common::NULL_UUID
      attributes[:authorizer_type] = ''
    end

    self.authorized_is(authorized).permission_is(permission).valid_at.alive.first_or_create! attributes

  end

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Authorization::Authorizing'
