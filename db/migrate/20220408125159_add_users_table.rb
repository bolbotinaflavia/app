class AddUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      # id
      t.string :name
      t.string :email
      t.integer :age
    end
  end
end

