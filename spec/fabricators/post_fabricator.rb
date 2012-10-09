Fabricator :post do
  title   { Faker::Lorem.sentence }
  content { Faker::Lorem.paragraphs(4) }
  published_at  { Time.now }
end