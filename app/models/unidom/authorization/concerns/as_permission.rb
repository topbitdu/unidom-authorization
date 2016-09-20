module Unidom::Authorization::Concerns::AsPermission

  extend ActiveSupport::Concern

  included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing'

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

    def authorize?(authorized, at: Time.now)

      raise ArgumentError.new('The authorized argument is required.') if authorized.blank?
      raise ArgumentError.new('The at argument is required.'        ) if at.blank?

      authorizings.authorized_is(authorized).valid_at(now: at).alive.exists?

    end

    def authorized?(authorized, at: Time.now)

      warn 'The #authorized? method is deprecated. It will be removed in the v2.0. Please use the #authorize? method instead.'
      authorize? authorized, at: at

    end

  end

  module ClassMethods
  end

end
