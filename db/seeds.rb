require 'faker'

puts 'Creating 10 fake workers...'
10.times do
  worker = Worker.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    alias: Faker::FunnyName.name,
    mobile_number: "+6591234567",
    id_type: "passport",
    description: Faker::Quote.famous_last_words,
  )
  worker.save!
  puts "Created a worker"
end
puts 'Finished creating workers!'

puts 'Creating 10 fake coordinators...'
10.times do
  coordinator = Coordinator.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    mobile_number: "+6591234567",
    telegram_handle: Faker::Twitter.screen_name,
    description: Faker::Quote.famous_last_words
  )
  coordinator.save!
  puts "Created a coordinator"
end
puts 'Finished creating coordinators!'

puts 'Creating 10 fake cases...'
10.times do
  xcase = Case.new(
    title: Faker::Quote.famous_last_words,
    story_summary: Faker::Quote.famous_last_words,
    start_date: "1 January 2021",
    end_date: "30 June 2021",
    target_amount: "100",
    status: "new",
    category: "medical",
    admin_approved: true,
    worker_id: Faker::Number.between(from: 1, to: 10),
    coordinator_id: Faker::Number.between(from: 1, to: 10),
    user_id: 1
  )
  xcase.save!
  puts "Created a case"
end
puts 'Finished creating cases!'

puts 'Creating 10 fake payments...'
10.times do
  payment = Payment.new(
    payee_name: Faker::Name.name,
    amount: Faker::Number.between(from: 1, to: 50),
    comment: Faker::Quote.famous_last_words,
    case_id: Faker::Number.between(from: 1, to: 10),
  )
  payment.save!
  puts "Created a payment"
end
puts 'Finished creating payments!'

