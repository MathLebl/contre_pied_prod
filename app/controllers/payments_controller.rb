class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @user = current_user
    # @order.comment << params[:comment]
    # @order.save!
  end

  # def order_params
  #   params.permit(:comment)
  # end

end
