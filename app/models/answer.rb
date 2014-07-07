class Answer < ActiveRecord::Base
	validates :response, presence: true
  belongs_to :question
  belongs_to :user
end
