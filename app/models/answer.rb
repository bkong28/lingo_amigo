class Answer < ActiveRecord::Base
	validates :response, presence: true
  belongs_to :question
end
