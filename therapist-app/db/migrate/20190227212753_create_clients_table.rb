class CreateClientsTable < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :date
      t.string :preferences
      t.string :content
      t.integer :user_id

      t.timestamps null: false     
    end
  end
end
