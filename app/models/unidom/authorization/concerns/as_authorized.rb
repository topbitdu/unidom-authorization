##
# As Authorized 是被授权的功能模块的领域逻辑关注点。

module Unidom::Authorization::Concerns::AsAuthorized

  extend ActiveSupport::Concern

  included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing', as:     :authorized
    has_many :permissions,  through:    :authorizings,                        source: :permission

    def is_authorized!(permission: nil, by: nil, at: Time.now)

      assert_present! :permission, permission
      assert_present! :by,         by
      assert_present! :at,         at

      authorizings.create! permission: permission, authorizer: by, opened_at: at

    end

    def is_authorized?(permission: nil, at: Time.now)

      assert_present! :permission, permission
      assert_present! :at,         at

      authorizings.permission_is(permission).valid_at(now: at).alive.exists?

    end

  end

  module ClassMethods
  end

end
