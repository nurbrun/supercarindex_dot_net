class CountriesController < ApplicationController
	def index
		@countries = Country.all
	end
	def show
		@country = Country.find_by_name(params[:id])	
	end
end
