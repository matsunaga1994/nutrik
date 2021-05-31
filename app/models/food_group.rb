class FoodGroup < ActiveHash::Base
  self.data = [
    { id: 1, name: '１群：魚、肉、卵、大豆、大豆製品' },
    { id: 2, name: '２群：牛乳、乳製品、海藻、小魚類' },
    { id: 3, name: '３群：緑黄色野菜' },
    { id: 4, name: '４群：淡色野菜、果物' },
    { id: 5, name: '５群：穀物、イモ類、砂糖' },
    { id: 6, name: '６群：油脂類、脂肪の多い食品' }
  ]

include ActiveHash::Associations
has_many :ingredients

end