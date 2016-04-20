class CreatePacksTable < ActiveRecord::Migration
  def change
    create_table(:packs) do |t|
      t.decimal :price_pack,        null: false, default: 0
      t.boolean :active,            null: false, default: false
      t.belongs_to :user,           null: false

      t.timestamps null: false
    end
  end
end
