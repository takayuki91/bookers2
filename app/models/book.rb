class Book < ApplicationRecord
  
  # UserモデルとBookモデルをアソシエーション
  belongs_to :user
  
end
