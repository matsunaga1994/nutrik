class Cost < ActiveHash::Base
  self.data = [
    { id: 1, name: '100円以下' },
    { id: 2, name: '300円前後' },
    { id: 3, name: '500円前後' },
    { id: 4, name: '1,000円前後' },
    { id: 5, name: '2,000円前後' },
    { id: 6, name: '3,000円前後' },
    { id: 7, name: '5,000円前後' },
    { id: 8, name: '10,000円前後' },
  ]

include ActiveHash::Associations
has_many :foods

end