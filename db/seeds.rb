Comment.destroy_all
Idea.destroy_all

100.times do 
  Idea.create(title: Faker::Lorem.characters(number: 15, min_alpha: 15), content: Faker::Lorem.paragraph(random_sentences_to_add: 4))
end

500.times do
  Comment.create(content: Faker::Lorem.paragraph(sentence_count: 4), idea_id: Idea.all.sample.id)
end


