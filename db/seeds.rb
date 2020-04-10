# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding users'
user = User.create(
  id: 1,
  email: 'user@example.com',
  password: 'foobar',
);

puts "#{User.count} users seeded"

puts 'Seeding Elections'
election = Election.create(
  id: 1,
  user_id: user.id,
  name: 'Election_1'
)
byebug
puts "#{Election.count} elections seeded"

puts 'Seeding Questions'
question1, question2 = Question.create([{
  id: 1,
  election_id: election.id,
  name: 'Question 1',
},{
  id: 2,
  election_id: election.id,
  name: 'Question 2',
}])
puts "#{Question.count} question seeded"

puts 'Seeding Answers'
Answer.create([
  {
    question_id: question1.id,
    name: 'Answer 1.1',
  },
  {
    question_id: question1.id,
    name: 'Answer 1.2',
  },
  {
    question_id: question1.id,
    name: 'Answer 1.3',
  },
  {
    question_id: question1.id,
    name: 'Answer 1.4',
  },
  {
    question_id: question2.id,
    name: 'Answer 2.1',
  },
  {
    question_id: question2.id,
    name: 'Answer 2.2',
  },
  {
    question_id: question2.id,
    name: 'Answer 2.3',
  },
  {
    question_id: question2.id,
    name: 'Answer 2.4',
  },
])
puts "#{Answer.count} answers seeded"

puts 'Seeding Voters'
Voter.create(
  id: 1,
  name: 'Jone Doe',
  email: 'voter@example.com',
  election_id: election.id
)
puts "#{Voter.count} voters seeded"

puts 'Seeds completed'
