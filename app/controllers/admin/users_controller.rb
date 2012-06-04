class Admin::UsersController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page], :order => "first_name asc")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to admin_users_path, notice: "User added successfully"
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, notice: "User updated successfully"
    else
      render :edit
    end
  end

  def destroy
    user = User.find(param[:id])

    if user.destroy
      flash[:notice] = "User deleted successfully"
    else
      flash[:errors] = user.errors.full_messages
    end
    redirect_to admin_users_path
  end

end
