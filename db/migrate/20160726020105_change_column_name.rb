class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :description, :body
  end
end
