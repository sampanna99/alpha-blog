class CreateChalaunes < ActiveRecord::Migration
  def change
    create_table :chalaunes do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
