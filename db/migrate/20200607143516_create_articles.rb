class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles, comment: '記事管理' do |t|
      t.string :subject, comment: '記事のタイトル', null: false
      t.text :body, comment: '記事の本文', null: false
      t.boolean :published_status, comment: '公開非公開ステータス', default: false
      t.index :published_status
      t.timestamps
    end
  end
end
