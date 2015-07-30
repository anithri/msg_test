class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :code_name, null: false
      t.string :real_name, null: false
      t.integer :sidekick_count, default: 0

      t.timestamps null: false
    end
  end
end
