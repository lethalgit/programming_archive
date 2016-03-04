class Question < ActiveRecord::Base
	acts_as_votable
	has_many :comments
end
