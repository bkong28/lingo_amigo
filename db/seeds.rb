# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(:email => 'admin@lingoamigo.com', :password => 'scarlet321', :password_confirmation => 'scarlet321', :admin => true)
admin.save

# Language.create(name: 'Korean')

["Mandarin",
	"Spanish",
	"Hindi",
	"Arabic",
	"Portuguese",
	"Bengali",
	"Russian",
	"Japanese",
	"Punjabi",
	"German",
	"Javanese",
	"Wu",
	"Malay/Indonesian",
	"Telegu",
	"Vietnamese",
	"Korean",
	"French",
	"Marathi",
	"Tamil",
	"Urdu",
	"Persian",
	"Turkish",
	"Italian",
	"Cantonese",
	"Thai",
	"Gujarati",
	"Jin",
	"Min Nan",
	"Polish",
	"Pashto",
	"Kannada",
	"Xiang",
	"Malayalam",
	"Sundanese",
	"Hausa",
	"Oriya",
	"Burmese",
	"Hakka",
	"Ukrainian",
	"Bhojpuri",
	"Tagalog",
	"Yoruba",
	"Maithili",
	"Swahili",
	"Uzbek",
	"Sindhi",
	"Amharic",
	"Fula",
	"Romanian",
	"Oromo",
	"Igbo",
	"Azerbaijani",
	"Awadhi",
	"Gan",
	"Cebuano",
	"Dutch",
	"Kurdish",
	"Serbo-Croatian",
	"Malagasy",
	"Saraiki",
	"Nepali",
	"Sinhalese",
	"Chittagonian",
	"Zhuang",
	"Khmer",
	"Assamese",
	"Madurese",
	"Somali",
	"Marwari",
	"Magahi",
	"Haryanvi",
	"Hungarian",
	"Chhattisgarhi",
	"Greek",
	"Chewa",
	"Deccan",
	"Akan",
	"Kazakh",
	"Min Bei",
	"Sylheti",
	"Zulu",
	"Czech",
	"Kinyarwanda",
	"Dhundari",
	"Haitian Creole",
	"Min Dong",
	"Ilokano",
	"Quechua",
	"Kirundi",
	"Swedish",
	"Hmong",
	"Shona",
	"Uyghur",
	"Hiligaynon",
	"Mossi",
	"Xhosa",
	"Belarusian",
	"Balochi",
	"Konkani"].each do |l|
	Language.find_or_create_by_name(l)
end