module Unidom::Authorization::Concerns::AsAuthorized

  extend ActiveSupport::Concern

  included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing', as:     :authorized
    has_many :permissions,  through:    :authorizings,                        source: :permission

    def is_authorized!(permission: nil, by: nil, at: Time.now)
      raise ArgumentError.new('The permission argument is required.') if permission.blank?
      raise ArgumentError.new('The by argument is required.'        ) if by.blank?
      raise ArgumentError.new('The at argument is required.'        ) if at.blank?
      authorizings.create! permission: permission, authorizer: by, opened_at: at
    end

    def is_authorized?(permission: nil, at: Time.now)
      raise ArgumentError.new('The permission argument is required.') if permission.blank?
      raise ArgumentError.new('The at argument is required.'        ) if at.blank?
      authorizings.permission_is(permission).valid_at(now: at).alive.exists?
    end

  end

end
