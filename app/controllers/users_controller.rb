class UsersController < ApplicationController
  before_action :find_user, only: [ :full_name ]

  def full_name
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end