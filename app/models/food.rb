class Food < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many_attached :images
  belongs_to :cook_time
  belongs_to :cost
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search != ""
      Food.where('title LIKE(?)', "%#{search}%")
    else
      Food.all
    end
  end
end
