class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :shippingfee
belongs_to :prefecture
belongs_to :shipDate
belongs_to :user
has_one_attached :image

with_options presence: true do
validates :name
validates :description
validates :category
validates :condition
validates :shippingfee
validates :prefecture
validates :shipDate
end
validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:  9,999,999}
validates :prefecture, numericality: {other_than: 0}

end
