class Food < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cook_time
  belongs_to :cost
  belongs_to :user
  has_many :ingredients
  has_many :recipes
end
