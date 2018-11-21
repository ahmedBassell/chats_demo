class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.integer :messages_count
      t.string :app_token
      t.references :app, foreign_key: true

      t.timestamps
    end

    add_index :chats, [:app_token, :number], unique: true
  end
end
