class UsersController < ApplicationController
  def new
    @user = User.new
    render "/users/new"
  end

  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password])
    if @user.save
      redirect_to '/'
    else
      @errors = "Try again."
      render '/users/new'
    end
  end

  def show
    @user=current_user
  end
end
