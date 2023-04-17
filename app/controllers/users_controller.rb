class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    # そのユーザー
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
