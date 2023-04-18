class UsersController < ApplicationController
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully!!"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end
  
  # def update
  #   @book = Book.find(params[:id])
  #   if @book.update(book_params)
  #     flash[:notice] = "Book was successfully updated!!"
  #     redirect_to book_path(@book.id)
  #   else
  #     render :edit
  #   end
  # end
  # if @book.save
  #     flash[:notice] = "You have created book successfully."
  #     redirect_to book_path(@book)
  #   else
  #     @books = Book.all
  #     @user = current_user
  #     render :index
  #   end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
