class CreateBaseOfOperations < ActiveRecord::Migration
  def change
    create_table :base_of_operations do |t|
      t.string :name
      t.boolean :secret_base
      t.references :hero, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
