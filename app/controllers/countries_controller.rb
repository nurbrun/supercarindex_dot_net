class CountriesController < ApplicationController
	def index
		@countries = Country.all
	end
	def show
		@country = Country.find_by_name(params[:id])
		@supercars_by_country = @country.supercars.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")	
	end
end
