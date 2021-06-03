class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :food_group
  belongs_to :food
end
