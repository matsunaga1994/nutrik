class Time < ActiveHash::Base
  self.data = [
    { id: 1, name: '5分以内' },
    { id: 2, name: '約10分' },
    { id: 3, name: '約15分' },
    { id: 4, name: '約30分' },
    { id: 5, name: '約1時間' },
    { id: 6, name: '1時間以上' }
  ]

include ActiveHash::Associations
has_many :foods

end