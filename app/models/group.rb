class Group < ApplicationRecord

  has_many :group_users
  has_many :users, through: :group_users
  has_one_attached :image

  validates :name, presence: true
  validates :intro, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
