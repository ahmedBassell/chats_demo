class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :number
      t.integer :chat_number
      t.string :body
      t.references :chat, foreign_key: true

      t.timestamps
    end

    add_index :messages, [:chat_number, :number], unique: true
  end
end
