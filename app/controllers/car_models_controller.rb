class CarModelsController < ApplicationController
	def index
		@car_models = CarModel.all
	end
	def show
		@car_model = CarModel.find_by_name(params[:id])	
	end

	def show
		@car_model = CarModel.find_by_name(params[:id])
		@supercars_by_model = @car_model.supercars.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")	
	end
end
