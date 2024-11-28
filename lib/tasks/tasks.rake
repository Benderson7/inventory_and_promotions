desc "Create demo items and promotions"
task create_demo: [ :environment ] do
    Item.create(name: "apple", price: 1.7, by_weight: true, categories: [ "fruit", "produce" ], brand: "cosmic crisp")
    Item.create(name: "banana", price: 2.1, by_weight: true, categories: [ "fruit", "produce" ], brand: nil)
    Item.create(name: "broccoli", price: 0.5, by_weight: true, categories: [ "veggies", "produce" ], brand: nil)
    Item.create(name: "pasta", price: 5, by_weight: false, categories: [ "pasta" ], brand: nil)
    Item.create(name: "sauce", price: 8, by_weight: false, categories: [ "pasta", "sauce" ], brand: nil)

    Promotion.create(name: "fruit_flat", discount_logic: { type: :flat, scope: :category, applies_to: :fruit, value: 1 })
    Promotion.create(name: "pasta_percentage", discount_logic: { type: :percentage, scope: :category, applies_to: :pasta, value: 0.1 })
    Promotion.create(name: "buy_1_get_1_banana", discount_logic: { type: :x_for_y, scope: :item, applies_to: :banana, x: 1, y: 1, value: 1 })
    Promotion.create(name: "buy_3_get_half_off_banana", discount_logic: { type: :x_for_y, scope: :item, applies_to: :banana, x: 3, y: 1, value: 0.5 })
    Promotion.create(name: "broccoli_threshold", discount_logic: { type: :threshold, scope: :item, applies_to: :broccoli, threshold: 5, value: 0.5 })
end
