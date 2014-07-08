class Property < ActiveRecord::Base
  has_many :variant_properties
  has_many :variants
end
