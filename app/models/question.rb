class Question < ActiveRecord::Base
	validates :phrase, presence: true
end
