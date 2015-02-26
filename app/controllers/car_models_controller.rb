class CarModelsController < ApplicationController
	def index
		@car_models = CarModel.all
	end
	def show
		@car_model = CarModel.find_by_name(params[:id])	
	end
end
