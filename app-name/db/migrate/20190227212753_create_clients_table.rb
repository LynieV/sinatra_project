class CreateClientsTable < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :content
      t.integer :user_id

     
    end
  end
end
