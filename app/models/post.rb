class Post < ApplicationRecord
  belongs_to :user
  enum status: { unsalable: 0, salable: 1 }
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  
  has_many :funs, dependent: :destroy
  def fun_user(user_id)
    funs.find_by(user_id: user_id)
  end
  
  has_many :scares, dependent: :destroy
  def scare_user(user_id)
    scares.find_by(user_id: user_id)
  end
  
  has_many :worsts, dependent: :destroy
  def worst_user(user_id)
    worsts.find_by(user_id: user_id)
  end

end