class Soldier < ActiveRecord::Base
    has_many :pictures, through: :identifications
end
