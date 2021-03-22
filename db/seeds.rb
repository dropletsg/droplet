require 'faker'

puts 'Creating 100 fake workers...'
100.times do
  worker = Worker.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    alias: Faker::FunnyName.name,
    mobile_number: Faker::PhoneNumber.phone_number,
    description: Faker::Quote.famous_last_words,
  )
  worker.save!
end
puts 'Finished!'
