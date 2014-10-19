class AddTitleAndContentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :title, :string
    add_column :comments, :content, :string
  end
end
