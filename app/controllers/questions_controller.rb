class QuestionsController < ApplicationController
	before_action :set_question, only: [:show,
                                   :edit,
                                   :update,
                                   :destroy]
	
	def index
		@questions = Question.all
		# put language something here for index to show?	

	end

	def new
		@question = Question.new
		@languages = Language.all

	end

	def create
  	@question = Question.new(question_params)
  	  
  	if @question.save
	    flash[:notice] = "Question has been created."
	    redirect_to @question
  	else
    	flash[:alert] = "Question has not been created."
    	@languages = Language.all

    	render "new"
    end
	end

	def show
	end

	def edit
	end

	def update
	  if @question.update(question_params)
	    flash[:notice] = "Question has been updated."
	    redirect_to @question
	  else
	    flash[:alert] = "Question has not been updated."
	    render "edit"
	  end
	end

	def destroy
	  @question.destroy
	  flash[:notice] = "Question has been destroyed."
	  redirect_to questions_path
	end

	private
	  def question_params
	    params.require(:question).permit(:phrase, :language)
		end

		def set_question
	    @question = Question.find(params[:id])
	  rescue ActiveRecord::RecordNotFound
	    flash[:alert] = "The question you were looking" +
	                    " for could not be found."
	    redirect_to questions_path
	  end

end

