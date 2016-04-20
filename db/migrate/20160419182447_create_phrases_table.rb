class CreatePhrasesTable < ActiveRecord::Migration
  def change
    create_table(:phrases) do |t|
      t.string :quote
      t.string :author

      t.timestamps null: false
    end
  end
end
