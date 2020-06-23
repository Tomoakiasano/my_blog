class CreateArticles < ActiveRecord::Migration[6.0]
  # subject 記事タイトル
  # body 記事本文
  # published_status 公開非公開ステータス
  def change
    create_table :articles do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.boolean :published_status, default: false
      t.timestamps
    end
  end
end
