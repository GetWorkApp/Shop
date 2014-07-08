class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :variant_properties
  has_many :properties, :through => :variant_properties
end
