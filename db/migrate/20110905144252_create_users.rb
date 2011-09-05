class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :id
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :link
      t.string :gender
      t.string :email
      t.string :uid
      t.string :rfid
      t.text :access_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
