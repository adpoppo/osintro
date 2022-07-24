class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '本' },
    { id: 2, name: 'ミュージック・楽器' },
    { id: 3, name: '動画・映像作品' },
    { id: 4, name: 'ゲーム' },
    { id: 5, name: '家電・AV機器' },
    { id: 6, name: 'パソコン・周辺機器' },
    { id: 7, name: '文房具・オフィス用品' },
    { id: 8, name: '家具・インテリア' },
    { id: 9, name: 'ペット・動物' },
    { id: 10, name: '食品・飲料・お酒' },
    { id: 11, name: '日用品・化粧品' },
    { id: 12, name: 'ベビー・おもちゃ・ホビー' },
    { id: 13, name: 'ファッション' },
    { id: 14, name: 'スポーツ・アウトドア' },
    { id: 15, name: '車・バイク' },
    { id: 16, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end