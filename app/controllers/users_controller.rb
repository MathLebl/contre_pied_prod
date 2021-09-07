class UsersController < ApplicationController
  before_action :find_user, only: [ :full_name ]

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    @user.update(user_params)
    redirect_to me_users_path
  end

  def me
    @user = current_user
    @orders = find_orders(@user.id)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_orders(id)
    Order.where(user_id: id)
  end

  def user_params
    params.require(:user).permit(:first_name, :name, :address, :city, :zip_code, :country, :phone, :email)
  end
end
