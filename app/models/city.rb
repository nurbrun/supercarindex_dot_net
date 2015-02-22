class City < ActiveRecord::Base
	has_many :supercars
    validates_presence_of :name
end
