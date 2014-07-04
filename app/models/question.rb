class Question < ActiveRecord::Base
	validates :phrase, presence: true
	has_many :answers
	belongs_to :language
end
