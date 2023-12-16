class AddTagToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :tag, :integer
  end
end
