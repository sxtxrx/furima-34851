class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :ship_cost
belongs_to :prefecture
belongs_to :ship_day
belongs_to :user
has_one_attached :image

with_options presence: true do
validates :name
validates :description
validates :category_id
validates :condition_id
validates :ship_cost_id
validates :prefecture_id
validates :ship_day_id
end
# validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:  9,999,999}
validates :prefecture_id, numericality: {other_than: 0}

end
