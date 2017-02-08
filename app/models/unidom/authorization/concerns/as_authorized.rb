##
# As Authorized 是被授权的参与者或访问者的领域逻辑关注点。

module Unidom::Authorization::Concerns::AsAuthorized

  extend ActiveSupport::Concern

  included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing', as:     :authorized
    has_many :permissions,  through:    :authorizings,                        source: :permission

    ##
    # 将本参与者或访问者，授予指定的权限 permission ， by 是授权者， at 是授权时间，缺省为当前时间。如：
    # 假设 selected_person 对应的类已经 include Unidom::Authorization::Concerns::AsAuthorized 。
    # selected_person.is_authorized! permission, by: current_person
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

    def is_prohibited!(permission: nil, at: Time.now)

      assert_present! :permission, permission
      assert_present! :at,         at

      authorizings.permission_is(permission).valid_at(now: at).alive.update_all closed_at: at, defunct: true

    end

  end

  module ClassMethods
  end

end
