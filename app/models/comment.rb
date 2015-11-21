class Comment < ActiveRecord::Base
  #association
  belongs_to :user
  belongs_to :prototype
  #validation
  validates_presence_of :comment
end
