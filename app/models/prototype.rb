class Prototype < ActiveRecord::Base
  #association
  has_many :prototype_images , dependent: :destroy
  belongs_to :user
end
