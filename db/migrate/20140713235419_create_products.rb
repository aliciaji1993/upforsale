class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :id
      t.string :name
      t.float :price
      t.string :url

      t.timestamps
    end
  end
end
