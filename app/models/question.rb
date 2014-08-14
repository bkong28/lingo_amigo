class Question < ActiveRecord::Base
	validates :phrase, presence: true
	validates :language_id, presence: true
	has_many :answers, dependent: :delete_all
	# defines a language method on questions - both getter & setter methods
	belongs_to :language
	# delegate method provides ability to stop the Law of Dementer
	# delegate :name, to: :language, prefix: true
	mount_uploader :audio, AudioUploader

  def equal_to phrase_string
    remove_marks(phrase) == remove_marks(phrase_string)
  end

  def remove_marks phrase
    phrase.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '')
  end

  def find_equal_text
    Question.all.each do |q|
      return q if equal_to q.phrase and (self.language.name == q.language.name)
    end
    return false
  end
	
end
