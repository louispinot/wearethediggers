class Identification < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :picture
  belongs_to :user
end
