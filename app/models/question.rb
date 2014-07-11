class Question < ActiveRecord::Base
	validates :phrase, presence: true
	has_many :answers, dependent: :delete_all
	# defines a language method on questions - both getter & setter methods
	belongs_to :language
end
