class CitiesController < ApplicationController
	def index
		@cities = City.all
	end
	def show
		@city = City.find_by_name(params[:id])
		@supercars_by_city = @city.supercars.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")	
	end
end
