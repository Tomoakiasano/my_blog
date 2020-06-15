# 記事データ投入  
20.times do |n|
    Article.create!(
        subject: "test#{n}",
        body: "テストだよ" * n
    )
end