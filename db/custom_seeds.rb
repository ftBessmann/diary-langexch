# Generate custom users
chris = User.new(
	username: "chris",
	password: "1",
	email: "chris@mail.com"
)

mila = User.new(
	username: "mila",
	password: "1",
	email: "mila@mail.com"
)

renan = User.new(
	username: "renan",
	password: "1",
	email: "renan@mail.com"
)

shaun = User.new(
	username: "shaun",
	password: "1",
	email: "shaun@mail.com"
)

# Generate profiles for each custom user
chris.profile = Profile.create(
	name: "Chris",
	birthday: Faker::Date.between(40.years.ago, 18.years.ago),
	gender: "male",
	country: Country.find_by(name: "United States"),
	avatar_url: Faker::Avatar.image,
	description: "Let's do language exchange!"
)

mila.profile = Profile.create(
	name: "Mila",
	birthday: Faker::Date.between(40.years.ago, 18.years.ago),
	gender: "female",
	country: Country.find_by(name: "Belarus"),
	avatar_url: Faker::Avatar.image,
	description: "Let's do language exchange!"
)

renan.profile = Profile.create(
	name: "Renan",
	birthday: Faker::Date.between(40.years.ago, 18.years.ago),
	gender: "male",
	country: Country.find_by(name: "United States"),
	avatar_url: Faker::Avatar.image,
	description: "はじめまして。レナーンです。Let's do language exchange! 日本語を勉強しています。"
)

shaun.profile = Profile.create(
	name: "Shaun",
	birthday: Faker::Date.between(40.years.ago, 18.years.ago),
	gender: "male",
	country: Country.find_by(name: "United States"),
	avatar_url: Faker::Avatar.image,
	description: "Let's do language exchange!"
)

# Gather custom users into a collection
custom_users = [chris, mila, renan, shaun]

# Attach new diary to each profile and save the users
custom_users.each do |user|
	user.profile.diary = Diary.create
	# The user is finally saved
	user.save

	# Generate random number of fake diary entries for the user
	(0..8).to_a.sample.times do
		DiaryEntry.create(
			title: [Faker::Name.title, Faker::Book.title].sample,
			content: fake_description,
			language: Language.all.sample,
			diary: user.profile.diary,
		)
	end
end
