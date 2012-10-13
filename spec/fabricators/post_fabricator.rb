Fabricator :post, :from => 'Tabloids::Post' do
  title   { Faker::Lorem.sentence }
  content { Faker::Lorem.paragraphs(4) }
  published true
end