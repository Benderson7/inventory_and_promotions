class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, limit: 64
      t.decimal :price
      t.boolean :by_weight, default: false
      t.json :categories, default: []
      t.string :brand, null: true
      t.timestamps
    end
  end
end
