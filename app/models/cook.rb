class Cook < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :country
  belongs_to :serving

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :cook_name
    validates :recipe
    validates :material
    validates :country_id
    validates :serving_id
    validates :image
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :country_id
    validates :serving_id
  end
end
