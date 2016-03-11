class Question < ActiveRecord::Base
	acts_as_votable
	has_many :comments

	def self.terms_for(prefix)
		suggestions = where("name like ?", "%#{prefix}%")
		suggestions.limit(10).pluck(:name)
	end
end
