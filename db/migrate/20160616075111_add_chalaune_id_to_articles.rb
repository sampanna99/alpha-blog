class AddChalauneIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :chalaune_id, :integer
  end
end
