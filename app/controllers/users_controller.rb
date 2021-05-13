class UsersController < ApplicationController
  def show
     @user = User.find_by_id(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.description = params[:description]
    @user.email = params[:email]
    @user.age = params[:age]
    @user.city = City.first
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      redirect_to '/'
    else
      render :new
    end
  end

end
