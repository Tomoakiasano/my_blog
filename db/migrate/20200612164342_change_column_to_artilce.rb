class ChangeColumnToArtilce < ActiveRecord::Migration[6.0]
  def change
    change_column_null :articles, :subject, false
    change_column_null :articles, :body, false
    change_column :articles, :body, :text
  end
end
