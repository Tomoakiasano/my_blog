# 記事データ投入  
1.upto(20) do |n|
    Article.create!(
        subject: "test#{n}",
        body: "テストだよ" * n,
        published_status: true
    )
end