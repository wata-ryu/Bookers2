class ApplicationController < ActionController::Base
  #Bootstrap の flash messageを使えるようにキーを許可する
  add_flash_types :success, :info, :warning, :danger
  
  #deviseにまつわる画面に行った時に全てのコントローラーの実行前にアクションさせる
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #ログイン認証されていなければ、top,about以外はログイン画面へリダイレクトする（URLからの侵入を防げる）
  before_action :authenticate_user!, except: [:top, :about]
  
  
  #サインイン後の移動画面を指定
  def after_sign_in_path_for(resource)
    user_path(id: current_user)
    
  end
  
  
  protected
  
  def configure_permitted_parameters
#devise（Gem）のUserモデルに関わる「ログイン」「新規登録」などのリクエストからパラメーターを取得できるようになるメソッド。
#また、新しく追加したカラムをdeviseに定義されているストロングパラメーターに含めたい場合は、permitメソッドを用いることで含めることができる。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
