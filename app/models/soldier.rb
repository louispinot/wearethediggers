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
                              }

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

    pg_search_scope :search_by_service_number,
                    :against => :service_number,
                    :using => { tsearch: {
                                  prefix: true
                                }
                              }

    scope :unit, ->(unit) { where("unit = ?", unit) }
    scope :rank, ->(rank) { where("rank = ?", rank) }

    def full_name
      "#{first_name} #{last_name}"
    end
end
