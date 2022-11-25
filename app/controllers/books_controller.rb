class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    #@user = User.find(params[:id])
    #@books = @user.books
  end

  def show
    #@user = User.find(params[:id])
    #@books = @user.books.page(params[:page])
  end

  def destroy
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
