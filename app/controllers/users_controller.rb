class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(@book_params)
    
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      #flash[:notice] = "Book was successfully created."
      redirect_to user_path(current_user.id)
    else
      
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
