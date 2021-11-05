class ItemState < ActiveHash::Base
    self.data = [
      { id: 0, date: '---' },
      { id: 1, date: '新品・未使用' },
      { id: 2, date: '未使用に近い' },
      { id: 3, date: '目立った傷や汚れなし' },
      { id: 4, date: 'やや傷や汚れあり' },
      { id: 5, date: '傷や汚れあり' },
      { id: 6, date: '全体的に状態が悪い' }
    ]
end