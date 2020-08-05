test_users = [
  { name: 'あさの', email: 'asano@mail.com' },
  { name: 'ながはま', email: 'nagahama@mail.com' },
  { name: 'さとう', email: 'sato@mail.com' }
]
# ユーザー作成 test_usersが１度作成されたら次からは作成しない
test_users.each do |user|
  next if User.all.count >= 3
  User.create!(
    name: "#{user[:name]}",
    email: "#{user[:email]}",
    password: 'password'
  )
end

# 記事データ投入
1.upto(20) do |n|
  User.all.each do |user|
    user.articles.create!(
      subject: "test#{n}",
      body: "テストだよ" * n,
      published_status: n.even? ? true : false
    )
  end
end