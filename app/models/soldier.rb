class Soldier < ActiveRecord::Base
    has_many :pictures, through: :identifications
    has_many :identifications
    accepts_nested_attributes_for :identifications

    include PgSearch
    ## look at "Dynamic search scopes" to pass options in view like "search_by:"
    pg_search_scope :search_by_name_with_rank,
                    :against => [:first_name, :last_name, :rank],
                    :using => {tsearch: {
                                  prefix: true,
                                  any_word: true
                                  }
                              }
    pg_search_scope :search_by_service_number,
                    :against => :service_number,
                    :using => {tsearch: {
                                  prefix: true
                                  }
                              }

    scope :unit, ->(unit) { where("unit = ?", unit) }


end
