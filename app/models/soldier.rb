class Soldier < ActiveRecord::Base
    has_many :pictures, through: :identifications
    has_many :identifications
    accepts_nested_attributes_for :identifications

    include PgSearch


    pg_search_scope :search_by_name,
                    :against => [:first_name, :last_name],
                    :using => { tsearch: {
                                  prefix: true,
                                  any_word: true
                                }
                              },
                    :order_within_rank => "last_name ASC"

    def self.name_search(query)
      selection = []
      self.all.each do |soldier|
        query.each do |word|
          prefix_index = word.length - 1
          if (soldier.first_name.downcase[0..prefix_index] == word.downcase || soldier.last_name.downcase[0..prefix_index] == word.downcase)
            selection << soldier
          end
        end
      end
      selection.uniq!
      selection
    end


    pg_search_scope :filter_by_unit,
                    :against => :unit,
                    :using => { tsearch: {
                                  prefix: true,
                                  any_word: true
                                }
                              }

    pg_search_scope :filter_by_rank,
                    :against => :rank,
                    :using => { tsearch: {
                                  prefix: true,
                                  any_word: true
                                }
                              }



    scope :unit, ->(unit) { where("unit = ?", unit) }
    scope :service_number, ->(service_number) { where("service_number = ?", service_number) }
    scope :rank, ->(rank) { where("rank = ?", rank) }

    def full_name
      "#{first_name} #{last_name}"
    end
end
