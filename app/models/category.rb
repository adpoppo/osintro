class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ミュージック' },
    { id: 2, name: '本' },
    { id: 3, name: '映画' },
    { id: 4, name: 'ゲーム' },
    { id: 5, name: 'スポーツ' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end