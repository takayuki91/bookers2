class Book < ApplicationRecord
  
  # UserモデルとBookモデルをアソシエーション
  belongs_to :user
  
  # ActiveStrageでプロフィール画像を保存できるように
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
  　unless profile_image.attached?
    file_path = Rails.root.join('app/assets/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  　end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
