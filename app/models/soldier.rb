class Soldier < ActiveRecord::Base
    has_many :pictures, through: :identifications
    has_many :identifications
    accepts_nested_attributes_for :identifications
end
