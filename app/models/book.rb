class Book < ApplicationRecord
     
     #アクティブストレージで画像を使用するための記述
     has_one_attached :image
     
     has_one_attached :profile_image
     
     #userが１に対してbookがNである記述
     belongs_to :user
     #バリデーション設定、trueと記述するとデータが存在しなければならない
     validates :title, presence: true
     validates :body, presence: true, length: { maximum: 200 }
end
