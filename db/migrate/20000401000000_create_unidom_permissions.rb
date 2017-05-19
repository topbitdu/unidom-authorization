class CreateUnidomPermissions < ActiveRecord::Migration

  def change

    create_table :unidom_permissions, id: :uuid do |t|

      t.string :name, null: false, default: '',  limit: 200
      t.string :path, null: true,  default: nil, limit: 200

      t.text :description

      t.column   :state, 'char(1)', null: false, default: Unidom::Common::STATE
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

  end

end
