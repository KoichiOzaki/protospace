class Prototype < ActiveRecord::Base
  #association
  has_many :prototype_images , dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :prototype_images

  #validation
  validates_presence_of :title, :catchcopy, :concept

  #default per_page value for kaminari gem
  paginates_per 8
end
