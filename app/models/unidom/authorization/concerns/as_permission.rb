##
# As Permission 是权限的领域逻辑关注点。

module Unidom::Authorization::Concerns::AsPermission

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing'

    ##
    # 将本权限授予指定的参与者或访问者 authorized ， by 是授权者， at 是授权时间，缺省为当前时间。如：
    # permission.authorize! selected_person, by: current_person
    def authorize!(authorized, by: nil, at: Time.now)

      assert_present! :authorized, authorized
      assert_present! :by,         by
      assert_present! :at,         at

      attributes = { authorized: authorized, authorizer: by, opened_at: at }
      #if by.present?
      #  attributes[:authorizer] = by
      #else
      #  attributes[:authorizer_id]   = Unidom::Common::NULL_UUID
      #  attributes[:authorizer_type] = ''
      #end
      authorizings.create! attributes

    end

    def authorize?(authorized, at: Time.now)

      assert_present! :authorized, authorized
      assert_present! :at,         at

      authorizings.authorized_is(authorized).valid_at(now: at).alive.exists?

    end

    def authorized?(authorized, at: Time.now)

      warn 'The #authorized? method is deprecated. It will be removed in the v2.0. Please use the #authorize? method instead.'
      authorize? authorized, at: at

    end

    def prohibit!(authorized, at: Time.now)

      assert_present! :authorized, authorized
      assert_present! :at,         at

      authorizings.authorized_is(authorized).valid_at(now: at).alive.update_all closed_at: at, defunct: true

    end

  end

  module ClassMethods
  end

end
