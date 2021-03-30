class ListItem < ApplicationRecord
  belongs_to :cart
  belongs_to :clothing

  def total_price
    if quantity.to_i >= 3 && quantity.to_i < 5
      (clothing.price.to_i * quantity.to_i) - 100
    elsif quantity.to_i >= 5 && quantity.to_i > 7
      (clothing.price.to_i * quantity.to_i) - 300
    elsif quantity.to_i >= 7
      (clothing.price.to_i * quantity.to_i) - 400
    elsif clothing.brand == "H&M"
      (clothing.price.to_i * quantity.to_i) - (0.3 * (clothing.price.to_i * quantity.to_i))
    else
      (clothing.price.to_i * quantity.to_i)
    end
  end
end
