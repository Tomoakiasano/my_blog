# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      ## Database authenticatable
      # パスワードを暗号化してデータベースに保存し、サインイン中にユーザーの認証を検証。認証はPOSTリクエストまたはBasic認証の両方で実行可能。
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # ユーザーパスワードをリセットし、通知
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      # 保存されたCookieからユーザーを記憶するためのトークンを生成、削除
      t.datetime :remember_created_at

      ## Trackable
      # サインイン回数や、サインイン時間、IPアドレスを記録
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # メールに記載されているURLをクリックして本登録を完了する等、よくある登録方式を提供。また、サインイン中にアカウントが認証済みかどうかを検証。
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # 一定回数サインインを失敗するとアカウントをロックする。ロック解除にはメールによる解除か、一定時間経つと解除するといった方法がある。
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
