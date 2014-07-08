class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category
end
