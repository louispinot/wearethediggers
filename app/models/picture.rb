class Picture < ActiveRecord::Base
  include PgSearch

  has_many :soldiers, through: :identifications
  has_many :identifications
  accepts_nested_attributes_for :identifications


end
