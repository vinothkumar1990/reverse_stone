class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :owner_name
      t.string :address
      t.string :email_id
      t.string :shop_type
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
