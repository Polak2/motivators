class Tagging < ActiveRecord::Base
  belongs_to :mem
  belongs_to :tag
end
