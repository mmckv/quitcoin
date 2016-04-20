class CreateBanksTable < ActiveRecord::Migration
  def change
    create_table(:banks) do |t|
      t.decimal :value
      t.belongs_to :phrase
      t.belongs_to :user,   null: false

      t.timestamps null: false
    end
  end
end
