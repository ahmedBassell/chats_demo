class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.string :token
      t.string :name

      t.timestamps
    end
  end
end
