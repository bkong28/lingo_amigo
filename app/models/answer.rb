class Answer < ActiveRecord::Base


  belongs_to :question
  belongs_to :user
  
  mount_uploader :audio, AudioUploader

  acts_as_votable
end
