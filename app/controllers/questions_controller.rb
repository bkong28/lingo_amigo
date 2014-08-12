class QuestionsController < ApplicationController
	
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :collect_languages, only: [:new, :edit, :update]

  before_action :authenticate_user!, except: [:new, :create]

  load_and_authorize_resource
	
	def index
		@questions = Question.all.includes(:language)
	end

	def new
		@question = Question.new
		collect_languages
		@questions = Question.all.includes(:language)
	end

	def create
  	@question = Question.new(question_params)
  	@questions = Question.all.includes(:language)
    eq = @question.find_equal_text
    if eq
      flash[:notice] = "This is a repeated question."
      redirect_to eq
    else
      if @question.save
        flash[:notice] = "Question has been created."
        redirect_to @question
      else
        flash[:alert] = "Question has not been created."
        collect_languages
        render "new"
      end
    end


	end

	def show
	end

	def edit
   	collect_languages
	end

	def update
	  if @question.update(question_params)
	    flash[:notice] = "Question has been updated."
	    redirect_to @question
	  else
	    flash[:alert] = "Question has not been updated."
			collect_languages
			render "edit"
	  end
	end

	def destroy
	  @question.destroy
	  flash[:notice] = "Question has been destroyed."
	  redirect_to root_path
	end

	private
	  def question_params
	    params.require(:question).permit(:phrase, :language_id)
		end

		def set_question
	    @question = Question.find(params[:id])
	  rescue ActiveRecord::RecordNotFound
	    flash[:alert] = "The question you were looking" +
	                    " for could not be found."
	    redirect_to questions_path
	  end

	  def collect_languages
	  	@languages = Language.all
	  end

end

