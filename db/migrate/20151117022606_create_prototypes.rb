class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.belongs_to    :user, index:true
      t.string        :title
      t.string        :catchcopy
      t.text          :concept
      t.timestamps null: false
    end
  end
end
