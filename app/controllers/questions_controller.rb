class QuestionsController < ApplicationController
  def index
  end

  def list
    platform = params[:platform]
    @questionList = Question.where(platform: platform);
  end

  def show
    @question = Question.find(params[:id])
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
