class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :name, index: true, null: false
      t.string :name_seed, null: false

      t.timestamps
    end
  end
end
