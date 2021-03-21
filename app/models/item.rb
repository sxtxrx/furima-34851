class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :shippingfee
belongs_to :prefecture
belongs_to :shipDate

belongs_to :user
has_one_attached :image

validates :



end
