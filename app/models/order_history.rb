class OrderHistory
    include ActiveModel::Model
    attr_accessor :prefecture_id,:post_code,:city,:address,:building_name,:phone_number,:history_id,:user_id,:item_id
    attr_accessor :token
    # ここにバリデーションの処理を書く
    with_options presence: true do
    validates :city
    validates :address
    validates :token
   end   
   validates :prefecture_id ,presence: true, numericality: { other_than: 0, message: "can't be blank" } 

   validates :phone_number,numericality:{ presence: true, only_integer: true, with: /\A\d{11}\z/}
   validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
   def save
        history= History.create(item_id: item_id, user_id: user_id)
       Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,  phone_number: phone_number,history_id: history.id)
   end
end

  