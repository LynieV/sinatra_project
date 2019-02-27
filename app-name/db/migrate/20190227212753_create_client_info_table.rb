class CreateClientInfoTable < ActiveRecord::Migration
  def change
    create_table :client_info do |t|
      t.string :content
      t.integer :user_id
    end
  end
end
