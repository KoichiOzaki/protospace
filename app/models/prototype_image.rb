class PrototypeImage < ActiveRecord::Base
  #association
  belongs_to :prototype
  #mount a uploader file of carrierwave
  mount_uploader :image, PrototypeImageUploader
end
