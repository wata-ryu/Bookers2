class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    #@user = User.find(params[:id])
    #@books = @user.books
  end
  
  def edit
   @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(current_user.id)
  end

  def show
   @book = Book.find(params[:id])
   @user = User.find(@book.user.id)
   @new_book = Book.new
   #検証機能
   #logger.debug("aaa")
   #logger.debug(@book.inspect)
  end
  
  def create
    #左下の投稿機能
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
