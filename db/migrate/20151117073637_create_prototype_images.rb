class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.belongs_to  :prototype , index:true
      t.string      :image
      t.timestamps null: false
    end
  end
end
