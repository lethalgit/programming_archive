class QuestionsController < ApplicationController
  def index
  end

  def list
    platforms = params[:platforms]
    if platforms == 'all'
      @question_list = Question.all
    else
      platforms = platforms.split('+')
      @question_list = Question.where(platform: platforms);
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def search
    @name = params[:search]
    @questions = Question.where(['name LIKE ?', '%'+@name+'%'])
  end

  def search_suggestions
    render json: Question.terms_for(params[:term])
  end

  def upvote
  	@question = Question.find(params[:id])
  	@question.upvote_by current_user
  	redirect_to :back
  end

  def downvote
  	@question = Question.find(params[:id])
  	@question.downvote_by current_user
  	redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit(:name, :slug, :submissions, :accuracy, :url, :platform, :tags, :languages_allowed, :date_added)
  end
end
