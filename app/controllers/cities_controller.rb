class CitiesController < ApplicationController
	def index
		@cities = City.all
	end
	def show
		@city = City.find_by_name(params[:id])	
	end
end
