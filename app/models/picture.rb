class Picture < ActiveRecord::Base
  has_many :soldiers, through: :identifications
end
