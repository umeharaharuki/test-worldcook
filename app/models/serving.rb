class Serving < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '一人前' },
    { id: 3, name: '二人前' },
    { id: 4, name: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :cooks
end