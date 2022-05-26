Comment.destroy_all
Idea.destroy_all

10.times do 
  Idea.create(title: Faker::Lorem.characters(number: 15, min_alpha: 15), content: Faker::Lorem.paragraph(random_sentences_to_add: 4))
end

20.times do
  Comment.create(content: Faker::Lorem.paragraph, idea_id: Idea.all.sample.id)
end


