class Product < ApplicationRecord
 mount_uploader :image, ImageUploader

 belongs_to :category
 has_many :favorites
 has_many :users, through: :favorites, source: :user
end
