class OrdersController < ApplicationController
    def index
        @item = Item.find(params[:item_id]) 
        @order_history = OrderHistory.new
        #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    end

    

    def create
      @item = Item.find(params[:item_id]) 
      @order_history = OrderHistory.new(order_params)
       if @order_history.valid?
        @order_history.save
        redirect_to root_path
       else
        render :index
      end
    end

    private

  def order_params
    params.require(:order_history).permit(:post_code,:prefecture_id, :city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end
  
  
  
end
