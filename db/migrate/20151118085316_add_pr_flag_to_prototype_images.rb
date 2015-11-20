class AddPrFlagToPrototypeImages < ActiveRecord::Migration
  def change
    add_column :prototype_images, :pr_flag, :integer
  end
end
