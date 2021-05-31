class Food < ApplicationRecord
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :time
end
