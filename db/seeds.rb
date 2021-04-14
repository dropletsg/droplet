require 'faker'

puts 'Creating 20 fake workers...'
20.times do
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

puts 'Creating 10 fake coordinators...'
10.times do
  coordinator = Coordinator.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    mobile_number: Faker::PhoneNumber.phone_number,
    telegram_handle: Faker::Twitter.screen_name,
  )
  coordinator.save!
end
puts 'Finished!'
