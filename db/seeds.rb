10.times do |n|
  name = Faker::Lorem.word
  Classification.create!(name: name)
end

10.times do |n|
  name = Faker::Lorem.word
  Skill.create!(name: name)
end

10.times do |n|
  name = Faker::Lorem.word
  Interest.create!(name: name)
end

10.times do |n|
  name = Faker::Lorem.word
  District.create!(name: name)
end

10.times do |n|
  name  = Faker::Company.name
  website = Faker::Internet.url
  address_1 = Faker::Address.street_address
  town = Faker::Address.city
  county = Faker::Address.state
  postcode = Faker::Address.postcode
  description = Faker::Lorem.paragraph
  classification_id = rand(10) + 1
  Organisation.create!(name:  name,
                                    website: website,
                                     address_1: address_1,
                                     town: town,
                                     county: county,
                                     postcode: postcode,
                                     description: description,
                                     classification_id: classification_id)
end

