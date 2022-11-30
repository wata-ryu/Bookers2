class BooksController < ApplicationController
  #Bootstrap の flash messageを使えるようにキーを許可する
  add_flash_types :success, :info, :warning, :danger
  
  def index
    #usersのshowと一部同じ定義を使っている
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
    @users = User.all
  end
  
  def edit
     @book = Book.find(params[:id])
     if @book.user == current_user
       render:edit
     else
       redirect_to books_path
     end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      #更新成功のflash message
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(current_user.id)
    else
      render:edit
    end
  end

  def show
   @book = Book.find(params[:id])
   @user = User.find(@book.user.id)
   @new_book = Book.new
   #検証機能
   #logger.debug("aaa")
   #logger.debug(@book.inspect)
  end
  
  def create#左下の投稿機能
    @book = Book.new(book_params)
    #現在のuserのidと一致する場合保存
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = User.find(@book.user.id)
      @books = Book.all
      render:index
    end
      
  end

  def destroy
    @book = Book.find(params[:id])#データ（レコード）を1件取得
    @book.destroy
    redirect_to books_path
  end
  
  private
  #ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
