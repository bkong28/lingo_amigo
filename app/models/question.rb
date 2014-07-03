class Question < ActiveRecord::Base
	validates :phrase, presence: true
	validates :language, presence: true

end
