class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index,:create]
  before_action :move_to_index, only: [:create,:index]



    def index
        @order_history = OrderHistory.new
        #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    end

    

    def create
      @order_history = OrderHistory.new(order_params)
       if @order_history.valid?
        pay_item
        @order_history.save
        redirect_to root_path
       else
        render :index
      end
    end

    private

  def order_params
    params.require(:order_history).permit(:post_code,:prefecture_id, :city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end
  
  def set_order
    @item = Item.find(params[:item_id]) 
  end
  
  def pay_item
    Payjp.api_key = "sk_test_482ca02b44c8ddbd82f440a7"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def move_to_index
    redirect_to root_path if @item.user_id
  end
end
