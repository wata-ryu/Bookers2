class Book < ApplicationRecord
     
     #アクティブストレージで画像を使用するための記述
     has_one_attached :image
     
     #userが１に対してbookがNである記述
     belongs_to :user
end
