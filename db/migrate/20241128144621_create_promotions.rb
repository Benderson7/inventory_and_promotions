class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.json :discount_logic, default: {}
      t.datetime :start_time
      t.datetime :end_time, null: true
      t.timestamps
    end
  end
end
