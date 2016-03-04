class QuestionsController < ApplicationController
	def index
	end

	def list
		platform = params[:platform]
		tag = params[:tag]
		@questions = Question.all
		@questions = @questions.where(:platform => platform)
		for question in @questions
			puts('tags', question.tags.split(',').map(&:to_s).length)
		end
	end

	def show
		@question = Question.find(params[:id])
	end

	private
		def question_params
			params.require(:question).permit(:name, :slug, :submissions, :accuracy, :url, :platform, :tags, :languages_allowed, :date_added)
		end
end
