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

  def self.authorize!(permission: nil, authorized: nil, authorizer: nil, opened_at: Time.now)
    raise ArgumentError.new('The authorized argument is required.') if authorized.blank?
    raise ArgumentError.new('The opened_at argument is required.' ) if opened_at.blank?
    raise ArgumentError.new('The permission argument is required.') if permission.blank?

    attributes = { opened_at: opened_at }
    if authorizer.present?
      attributes[:authorizer] = authorizer
    else
      attributes[:authorizer_id]   = Unidom::Common::NULL_UUID
      attributes[:authorizer_type] = ''
    end
    self.authorized_is(authorized).permission_is(permission).valid_at.alive.first_or_create! attributes
  end

end
