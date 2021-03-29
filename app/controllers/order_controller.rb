class OrderController < ApplicationController
    def index
        @order = Order.all
    end

    def new
        @order = Order.new
    end


    # private
    # def order_params
    #     require(),permit() 
    # end    
end
