class HomeController < ApplicationController
  def index
    @items = Item.all
    @promotions = Promotion.all
  end

  def add_item
    if cart[item.name]
      cart[item.name][:total] +
    else
      applied_promotion = 

      cart[item.name] = {
        quantity: parapms.expect(:quantity),
        applied_promotion:
      }
    end
  end

  private

  attr_reader :item, :cart

  # Use callbacks to share common setup or constraints between actions.
  def item
    @item ||= Item.find(params.expect(:id))
  end

  # 
  def cart
    cart = Rails.cache.read(:cart)
    return cart if cart
          
    Rails.cache.write(:cart, { total: 0 })
    Rails.cache.read(:cart)
  end

  def applied_promotion(item)
    applied_promotion = nil

    Promotion.all.each do |promotion|
      value = promotion_value(promotion, item)

      next if value.blank?
      
      if applied_promotion.blank? || promotion_value(applied_promotion, item) > value
        applied_promotion = promotion
      end
    end
  end
end
