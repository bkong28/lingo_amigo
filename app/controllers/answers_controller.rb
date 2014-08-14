class AnswersController < ApplicationController
	protect_from_forgery :except => [:save_file]
	before_action :set_question, :except => [:save_file]
	before_action :set_answer, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource

	def new
	  @answer = @question.answers.build
	  @languages = Language.all
	end

	def create	
	  @answer = @question.answers.build(answer_params)
	  @answer.user = current_user
	  @answer.audio = @@aud
	  if @answer.save
	    flash[:notice] = "Answer has been created."
	    redirect_to [@question]
	  else
	    flash[:alert] = "Answer has not been created."
	    render "new"
	  end
	end

	def edit
	end

	def update
	  if @answer.update(answer_params)
	    flash[:notice] = "Answer has been updated."
	    redirect_to [@question, @answer]
	  else
	    flash[:alert] = "Answer has not been updated."
	    render action: "edit"
	  end
	end

	def destroy
	 	@answer.destroy
	  flash[:notice] = "Answer has been deleted."
	  redirect_to @question
	end

	def save_file		  
	  audio = params[:audio]
	  @@aud= audio
	  render text: audio
  end

  def upvote
    @answer.liked_by current_user
    redirect_to @question
  end

  def downvote
    @answer.downvote_from current_user
    redirect_to @question
  end


  private
    def answer_params
      params.require(:answer).permit(:filename, :audio)
  	end
  
    def set_question
      @question = Question.find(params[:question_id])
    end
  
    def set_answer
    	@answer = @question.answers.find(params[:id]) 
  	end

end
