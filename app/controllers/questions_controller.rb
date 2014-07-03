class QuestionsController < ApplicationController
	
	def index
	end

	def new
		@question = Question.new
	end

	def create
  	@question = Question.new(question_params)
  	  	if @question.save
	    flash[:notice] = "Question has been created."
	    redirect_to @question
  	else
    	# nothing, yet
		end
	end

	def show
		@question = Question.find(params[:id])
	end

	private
	  def question_params
	    params.require(:question).permit(:phrase, :language)
	end

end

