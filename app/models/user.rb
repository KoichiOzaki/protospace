class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #association
  has_many :prototypes
  # validation
  validates_presence_of :username
  validates_uniqueness_of :username
  #mount a uploader file of carrierwave
  mount_uploader :avatar, AvatarUploader

end
