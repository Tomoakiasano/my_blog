class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, comment: '記事のコメント管理' do |t|
      t.text :text, comment: '記事へのコメント', null: false
      t.references :article, type: :integer, comment: '記事のID', null: false, index: true

      t.timestamps
    end
  end
end
