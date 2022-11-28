class UsersController < ApplicationController
  def show
   @book = Book.new
   #１人の
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  def index
    @books = Book.all
    @users = User.all
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
