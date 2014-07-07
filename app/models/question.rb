class Question < ActiveRecord::Base
	validates :phrase, presence: true
	has_many :answers, dependent: :delete_all
	belongs_to :language
end
