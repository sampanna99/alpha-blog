class AddPasswordDigestToChalaunes < ActiveRecord::Migration
  def change
    add_column :chalaunes, :password_digest, :string
  end
end
