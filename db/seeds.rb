test_users = [
  ['あさの', 'asano@mail.com', 'password'],
  ['ながはま', 'nagahama@mail.com', 'password'],
  ['さとう', 'sato@mail.com', 'password']
]
test_users.each do |user|
  User.create!(
    name: "#{user[0]}",
    email: "#{user[1]}",
    password: "#{user[2]}"
  )
end

# 記事データ投入  
1.upto(20) do |n|
  Article.create!(
    subject: "test#{n}",
    body: "テストだよ" * n,
    published_status: true,
    user_id: rand(1..3)
  )
end