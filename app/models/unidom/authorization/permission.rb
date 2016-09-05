# Permission 是权限。

class Unidom::Authorization::Permission < ActiveRecord::Base

  self.table_name = 'unidom_permissions'

  include Unidom::Common::Concerns::ModelExtension

  has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing'

  validates :name, presence:    true, length: { in: 2..self.columns_hash['name'].limit }
  validates :path, allow_blank: true, length: { in: 2..self.columns_hash['path'].limit }

  scope :path_is, ->(path) { where path: path }

  def authorize!(authorized, by: nil, at: Time.now)

    raise ArgumentError.new('The authorized argument is required.') if authorized.blank?
    raise ArgumentError.new('The by argument is required.'        ) if by.blank?
    raise ArgumentError.new('The at argument is required.'        ) if at.blank?

    attributes = { authorized: authorized, opened_at: at }
    if by.present?
      attributes[:authorizer] = by
    else
      attributes[:authorizer_id]   = Unidom::Common::NULL_UUID
      attributes[:authorizer_type] = ''
    end
    authorizings.create! attributes

  end

  def authorized?(authorized, at: Time.now)

    raise ArgumentError.new('The authorized argument is required.') if authorized.blank?
    raise ArgumentError.new('The at argument is required.'        ) if at.blank?

    authorizings.authorized_is(authorized).valid_at(now: at).alive.exists?
  end

end
