module Unidom::Authorization::Concerns::AsAuthorized

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing', as:     :authorized
    has_many :permissions,  through:    :authorizings,                        source: :permission

  end

end
