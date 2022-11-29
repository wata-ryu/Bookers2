class UsersController < ApplicationController
  #Bootstrap の flash messageを使えるようにキーを許可する
  add_flash_types :success, :info, :warning, :danger
  
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
    if @user.update(user_params)
      #user情報更新成功のflash message
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render:edit
    end
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
