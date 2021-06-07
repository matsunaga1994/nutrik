class Food < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :cook_time
  belongs_to :cost
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipes, dependent: :destroy
end
