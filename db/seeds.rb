User.create!(name: 'seb')
User.create!(name: 'tom')

seb = User.find_by(name: 'seb')
tom = User.find_by(name: 'tom')
puts "Create 2 users \n"


q = Question.create!(user_id: seb.id, name: 'What is the best programming language?')
a = Answer.create!(question_id: q.id, name: 'Ruby')
Response.create!(user_id: tom.id, answer_id: a.id)

puts "Created a question with an Response"


