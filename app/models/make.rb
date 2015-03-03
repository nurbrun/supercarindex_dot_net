class Make < ActiveRecord::Base
	has_many :supercars
    validates_presence_of :name
    def to_param
    	name
  	end
end
