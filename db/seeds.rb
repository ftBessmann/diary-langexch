require 'csv'
require 'faker'

Country.delete_all
Language.delete_all
User.delete_all
Profile.delete_all
Diary.delete_all
DiaryEntry.delete_all
Correction.delete_all
Comment.delete_all
NativeLanguage.delete_all
ForeignLanguage.delete_all
Like.delete_all

def japanese_text
	[
		"シュ杩ミョ 䶧ら 雤䋩磊きゅぬ 楎りゃ狥禌た, 飌郎 ら鰧鄩 ぷぎょ仯ぴょ碜 ぴゅとぎゅ觊稃",
		"鰣キャ㠣ゝ奎 韥ば みゃ鎌ぢビャしゅ フ饪馤つ䨦 郎訣鋨槣榦 谧ひゃ覌, 勤ぜ ほ谢ヴョ堥ぢゅ",
		"綩ぺ椺椦ゆ 祦きょびゃ 奤祧ぽさツォ や囤ヴャ檧䥦 焣障盤 ぢビャ, いけ槯 グり りゅ府ノ䏩篞 ヱ珣禚ゲ㦵 綩ぺ椺椦ゆ, 饪馤つ りゅ府ノ䏩篞 禯詎滥フャ鏧 チャも どろ背しへ 蛣䩣穤ー氨 韥ばで狧飌 飌郎",
		"サ愦み, 褤しょぎ 饺姤 りゅ府ノ䏩篞 みゃ鎌ぢビャしゅ, 饪馤つ",
		"とぎゅ フォ勣うサ愦 㨣䧨ゔヴェが 樦䋥 フャ鏧みゃ りゅ府ノ䏩篞 もくはぼ祦, 滧饯き 栩べ ぴゅとぎゅ觊稃 㨣䧨ゔヴェが"
	].sample
end

def fake_name
	[
		#Faker::Japanese::Name.name,
		"まゆみ", "山下", "山田", "佐藤",
		"王朋", "李友", "朋友",
		"João Ninguém", "Maria das Flores", "Antonio Careca",
		Faker::Name.name
	].sample
end

def fake_description
	[
		Faker::Lorem.paragraph,
		japanese_text
	].sample
end

CSV.foreach("db/data/countries.csv", { col_sep: "#" }) do |row|
	# The second element in the row array is the country name
	Country.create(name: row[1])
end

CSV.foreach("db/data/languages.csv") do |row|
	# The second element in the row array is the language name
	Language.create(name: row[1])
end

# Create fake users & their profiles
100.times do
	# Make a new user
	user = User.create(
		username: Faker::Internet.user_name,
		password: "1",
		#password: Faker::Internet.password,
		email: Faker::Internet.email
	)

	# Make a new profile
	profile = Profile.create(
		name: fake_name,
		birthday: Faker::Date.between(70.years.ago, 18.years.ago),
		gender: ["male", "female"].sample,
		country: Country.all.sample,
		avatar_url: Faker::Avatar.image,
		description: fake_description,
		user: user
	)

	# Make a diary for the profile
	diary = Diary.create(
		profile: profile
	)
end

# Generate fake diary entries
300.times do
	DiaryEntry.create(
		title: [Faker::Name.title, Faker::Book.title].sample,
		content: fake_description,
		language: Language.all.sample,
		diary: Diary.all.sample
	)
end

500.times do
	diary_entry = DiaryEntry.all.sample

	Correction.create(
		profile: Profile.all.sample,
		content: diary_entry.content.gsub(/a/,"A"),
		diary_entry: diary_entry
	)
end

1000.times do
	entry = [Correction.all.sample, DiaryEntry.all.sample].sample

	Comment.create(
		content: Faker::Lorem.sentence(4),
		commentable: entry,
		profile: Profile.all.sample
	)

end

# Go through each profile and assign a native and foreign language
Profile.all.each do |profile|
	native = NativeLanguage.new(language: Language.all.sample)
	foreign = ForeignLanguage.new(language: Language.all.sample)
	profile.native_language = native
	profile.foreign_language = foreign
	profile.save
end

# 100.times do
# 	NativeLanguage.create(
# 		profile: Profile.all.sample,
# 		language: Language.all.sample
# 	)

# 	ForeignLanguage.create(
# 		profile: Profile.all.sample,
# 		language: Language.all.sample
# 	)
# end

require_relative 'custom_seeds'

# Create likes for entries and corrections
800.times do
	Like.create(
		likeable: [DiaryEntry.all.sample, Correction.all.sample].sample,
		profile: Profile.all.sample
	)
end
