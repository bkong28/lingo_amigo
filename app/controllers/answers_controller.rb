class AnswersController < ApplicationController
	before_action :set_question
	before_action :set_answer, only: [:show, :edit, :update, :destroy]

	def new
	  @answer = @question.answers.build
	  @languages = Language.all
	end

	def create
	  @answer = @question.answers.build(answer_params)
	  if @answer.save
	    flash[:notice] = "Answer has been created."
	    redirect_to [@question, @answer]
	  else
	    flash[:alert] = "Answer has not been created."
	    render "new"
	  end
	end 

private
  def answer_params
    params.require(:answer).permit(:response)
	end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
  	@answer = @question.answers.find(params[:id])
	end

end
