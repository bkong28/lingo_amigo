class Question < ActiveRecord::Base
	validates :phrase, presence: true
	validates :language_id, presence: true
	has_many :answers, dependent: :delete_all
	# defines a language method on questions - both getter & setter methods
	belongs_to :language
	# delegate method provides ability to stop the Law of Dementer
	# delegate :name, to: :language, prefix: true
end
