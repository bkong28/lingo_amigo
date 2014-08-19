class QuestionMailer < ActionMailer::Base
  default :from => "lingoamigo@gmail.com"

  def new_answer(answer)
    @answer = answer
    mail(:subject => "New Answer for your question!", to: @answer.question.user.email)
  end
end
