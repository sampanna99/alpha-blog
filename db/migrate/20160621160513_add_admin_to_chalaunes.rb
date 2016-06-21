class AddAdminToChalaunes < ActiveRecord::Migration
  def change
    add_column :chalaunes, :admin, :boolean, default: false
  end
end
