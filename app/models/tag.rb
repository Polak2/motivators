class Tag < ActiveRecord::Base
	has_many :mems, through: :taggings
	has_many :taggings

	def to_s
		"#{name}"
	end
end
