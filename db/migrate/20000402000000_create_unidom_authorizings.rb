class CreateUnidomAuthorizings < ActiveRecord::Migration

  def change

    create_table :unidom_authorizings, id: :uuid do |t|

      t.references :authorizer, type: :uuid, null: false,
        polymorphic: { null: false, limit: 200 }
      t.references :authorized, type: :uuid, null: false,
        polymorphic: { null: false, limit: 200 }
      t.references :permission, type: :uuid, null: false

      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_authorizings, :permission_id
    add_index :unidom_authorizings, :authorizer_id
    add_index :unidom_authorizings, :authorized_id

  end

end
