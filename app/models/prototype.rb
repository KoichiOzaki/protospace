class Prototype < ActiveRecord::Base
  #association
  has_many :prototype_images, dependent: :delete_all
  belongs_to :user

  accepts_nested_attributes_for :prototype_images,reject_if: proc { |attributes| attributes['image'].blank? }

  #validation
  validates_presence_of :title, :catchcopy, :concept
  validate:images_main
  #default per_page value for kaminari gem
  paginates_per 8

  private
  def images_main
    prototype_images.each do |image|
      return if image.pr_flag == "main"
    end
    errors.add(:prototype_images, "can't be blank!(Please upload a main image.)")
  end
end
