class Comment < ActiveRecord::Base
  belongs_to :mem
  belongs_to :user
end
