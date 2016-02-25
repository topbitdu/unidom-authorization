# Permission 是权限。

class Unidom::Authorization::Permission < ActiveRecord::Base

  self.table_name = 'unidom_permissions'

  has_many :authorizings, class_name: 'Unidom::Authorization::Authorizing'

  validates :name, presence:    true, length: { in: 2..self.columns_hash['name'].limit }
  validates :path, allow_blank: true, length: { in: 2..self.columns_hash['path'].limit }

  scope :path_is, ->(path) { where path: path }

  include Unidom::Common::Concerns::ModelExtension

end
