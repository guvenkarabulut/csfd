class AddSummaryToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :summary, :string
  end
end
