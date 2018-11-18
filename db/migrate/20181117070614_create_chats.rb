class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.string :app_token
      t.references :app, foreign_key: true
      t.timestamps
    end
  end
end
