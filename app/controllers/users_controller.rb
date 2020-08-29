class UsersController < ApplicationController
  before_action :find_user, only: [ :full_name ]
  
  def me
    @user = current_user
    @orders = find_orders(@user.id)
  end

  def full_name
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_orders(id)
    Order.where(user_id: id)
  end
end
