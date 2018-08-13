class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :mileage
      t.integer :year
      t.string :body_type
      t.string :location
      t.integer :price
      t.string :transmission

      t.timestamps
    end
  end
end
