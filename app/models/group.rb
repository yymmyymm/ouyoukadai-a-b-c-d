class Group < ApplicationRecord

  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy

  has_many :users, through: :group_users, source: :user
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

  def is_owned_by?(user)
    owner.id == user.id
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

end
