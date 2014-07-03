class QuestionsController < ApplicationController
	
	def index
		@questions = Question.all
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
    	flash[:alert] = "Question has not been created."
    	
    	render "new"
    end
	end

	def show
		@question = Question.find(params[:id])
	end

	def edit
	  @question = Question.find(params[:id])
	end

	def update
	  @question = Question.find(params[:id])
	  if @question.update(question_params)
	    flash[:notice] = "Question has been updated."
	    redirect_to @question
	  else
	    flash[:alert] = "Question has not been updated."
	    render "edit"
	  end
	end

	private
	  def question_params
	    params.require(:question).permit(:phrase, :language)
	end

end

