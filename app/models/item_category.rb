class ItemCategory < ActiveHash::Base
  self.data = [
    { id: 0, date: '---' },
    { id: 1, date: 'メンズ' },
    { id: 2, date: 'レディース' },
    { id: 3, date: 'ベビー・キッズ' },
    { id: 4, date: 'インテリア・住まい・小物' },
    { id: 5, date: '本・音楽・ゲーム' },
    { id: 6, date: 'おもちゃ・ホビー・グッズ' },
    { id: 7, date: '家電・スマホ・カメラ' },
    { id: 8, date: 'スポーツ・レジャー' },
    { id: 9, date: 'ハンドメイド' },
    { id: 10, date: 'その他' }
  ]
end