class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :conversation, index: true, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
