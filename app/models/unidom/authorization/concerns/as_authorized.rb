module Unidom::Authorization::Concerns::AsAuthorized

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing', as:     :authorized
    has_many :permissions,  through:    :authorizings,                        source: :permission

    def is_authorized!(permission: nil, by: nil, at: Time.now)
      authorizings.create! permission: permission, authorizer: by, opened_at: at
    end

    def is_authorized?(permission: nil, at: Time.now)
      authorizings.permission_is(permission).valid_at(now: at).alive.exists?
    end

  end

end
