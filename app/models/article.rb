# == Schema Information
#
# Table name: articles
#
#  id             :bigint(8)        not null, primary key
#  isbn           :string(255)
#  title          :string(255)
#  author         :string(255)
#  publisher_name :string(255)
#  itemcaption    :string(255)
#  selesdate      :string(255)
#  image_url      :string(255)
#  item_url       :string(255)
#  summary        :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Article < ApplicationRecord
  belongs_to :user
  validates :isbn, presence: true, length: { maximum:255 }
  validates :title, presence: true, length: { maximum:255 }
  validates :author, presence: true, length: { maximum:255 }
  validates :publisher_name, presence: true, length: { maximum:255 }
  validates :itemcaption, length: { maximum: 300 }
  validates :selesdate, length: { maximum:255 }
  validates :image_url, presence: true, length: { maximum:255 }
  validates :item_url, presence: true, length: { maximum:255 }
  validates :summary, presence: true, length: { maximum:255 }
end
