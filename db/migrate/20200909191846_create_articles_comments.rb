class CreateArticlesComments < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_comments, comment: '記事とコメントの中間テーブル' do |t|
      t.references :comments, type: :integer, comment: 'コメントのID', null: false, index: true
      t.references :article, type: :integer, comment: '記事のID', null: false, index: true

      t.timestamps
    end
  end
end
