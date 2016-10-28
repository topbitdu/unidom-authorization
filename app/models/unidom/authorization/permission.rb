# Permission 是权限。

class Unidom::Authorization::Permission < Unidom::Authorization::ApplicationRecord

  self.table_name = 'unidom_permissions'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Authorization::Concerns::AsPermission

  validates :name, presence:    true, length: { in: 2..self.columns_hash['name'].limit }
  validates :path, allow_blank: true, length: { in: 2..self.columns_hash['path'].limit }

  scope :path_is, ->(path) { where path: path }

end
