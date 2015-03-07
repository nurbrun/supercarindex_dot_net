class SupercarsController < ApplicationController

	def index
		
		@supercars = Supercar.all.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")
		@make = Make.order('name asc').all
		@car_model = CarModel.order('name asc').all
		@city = City.order('name asc').all
		@country = Country.order('name asc').all

		if params[:supercar_fields]
	      @supercars = search
	    else

    end

	end

	def new
		@supercar = Supercar.new
		@supercar.make = Make.new
		@supercar.car_model = CarModel.new
		@supercar.city = City.new
		@supercar.country = Country.new
		# @supercar.spot_type = SpotType.new
	end

	def show
		@supercar = Supercar.find(params[:id])
	end

	# def search
	#   @makes = Make.search params[:search]
	# end

	def search
    search_params
    sanitized_search = search_params.delete_if { |k,v| v.blank? }
    # query = Card.all
    supercar_query = Supercar.all
    make_query = Make.all
    model_query = CarModel.all
    city_query = City.all
    country_query = Country.all
    sanitized_search.each do |key, value|

      if key == "make"
        if Make.where(["name iLIKE ?", "%#{value}%"]).first == nil
          make_query = []
          # query = [query, subtype_query].inject(&:&)      
          query = query.merge(make_query)
        else
          make_query = Make.where(["name iLIKE ?", "%#{value}%"]).first.supercars
          # query = [query, card_type_query].inject(&:&)
          query = query.merge(make_query)
        end
      end
      if key == "car_model"
        if CarModel.where(["name iLIKE ?", "%#{value}%"]).first == nil
          car_model_query = []
          # query = [query, subtype_query].inject(&:&)      
          query = query.merge(car_model_query)
        else
          car_model_query = CarModel.where(["name iLIKE ?", "%#{value}%"]).first.supercars
          # query = [query, card_type_query].inject(&:&)
          query = query.merge(car_model_query)
        end
      end
      if key == "city"
        if City.where(["name iLIKE ?", "%#{value}%"]).first == nil
          city_query = []
          # query = [query, subtype_query].inject(&:&)      
          query = query.merge(city_query)
        else
          city_query = City.where(["name iLIKE ?", "%#{value}%"]).first.supercars
          # query = [query, card_type_query].inject(&:&)
          query = query.merge(city_query)
        end
      end
      if key == "country"
        if Country.where(["name iLIKE ?", "%#{value}%"]).first == nil
          country_query = []
          # query = [query, subtype_query].inject(&:&)      
          query = query.merge(country_query)
        else
          country_query = Country.where(["name iLIKE ?", "%#{value}%"]).first.supercars
          # query = [query, card_type_query].inject(&:&)
          query = query.merge(country_query)
        end
      end    

    end
    # convert query back into Active Record object 
    # if query.class == Array    
    #   query = Card.where(id: query.map(&:id))
    # end

    query.page(params[:page])
  end

	# def show
	# 	@supercar = Supercar.find(params[:id])

	# 	if current_user
			
	# 	end
	# end

	def edit
  		@supercar = Supercar.find(params[:id])
	end

	def update
	  @supercar = Supercar.find(params[:id])

	  # @supercar.update(supercar_params)
	  # @supercar.make.update(make_params)
	  # @supercar.car_model.update(car_model_params)
	  # @supercar.city.update(city_params)
	  # @supercar.country.update(country_params)
	  # @supercar.spot_type.update(spot_type_params)

	  old_make_id = @supercar.make_id

	  @make = Make.where(:name => params[:make][:name])
	  make_id = @make.first_or_create.id
	  @supercar.make_id = make_id
	  @supercar.update_attributes(:make_id => make_id)

	  if Make.where(:id => old_make_id).first.supercars.empty?
	  	Make.where(:id => old_make_id).first.destroy!
	  else
	  end

	  old_car_model_id = @supercar.car_model_id

	  @car_model = CarModel.where(:name => params[:car_model][:name])
	  car_model_id = @car_model.first_or_create.id
	  @supercar.car_model_id = car_model_id
	  @supercar.update_attributes(:car_model_id => car_model_id)

	  if CarModel.where(:id => old_car_model_id).first.supercars.empty?
	  	CarModel.where(:id => old_car_model_id).first.destroy!
	  else
	  end

	  old_city_id = @supercar.city_id

	  @city = City.where(:name => params[:city][:name])
	  city_id = @city.first_or_create.id
	  @supercar.city_id = city_id
	  @supercar.update_attributes(:city_id => city_id)

	  if City.where(:id => old_city_id).first.supercars.empty?
	  	City.where(:id => old_city_id).first.destroy!
	  else
	  end

	  old_country_id = @supercar.country_id

	  @country = Country.where(:name => params[:country][:name])
	  country_id = @country.first_or_create.id
	  @supercar.country_id = country_id
	  @supercar.update_attributes(:country_id => country_id)

	  if Country.where(:id => old_country_id).first.supercars.empty?
	  	Country.where(:id => old_country_id).first.destroy!
	  else
	  end

	    if @supercar.update_attributes(supercar_params)
	      flash[:success] = "Supercar updated"
	      redirect_to '/admin/supercars'
	    else
	      render 'edit'
	    end
	end


	def create
		@supercar = Supercar.new(supercar_params)
		@supercar.make = Make.where(:name => params[:make][:name]).first_or_create
		@supercar.car_model = CarModel.where(:name => params[:car_model][:name]).first_or_create
		@supercar.city = City.where(:name => params[:city][:name]).first_or_create
		@supercar.country = Country.where(:name => params[:country][:name]).first_or_create
		# @supercar.spot_type = SpotType.new(spot_type_params)

		if current_user
			@supercar.user = current_user
		else
		end

	  	if @supercar.save
	  		redirect_to supercars_url
	  	else
	  		render :new
	  	end

	end
	
def destroy
end


	private
	def supercar_params
	 params.require(:supercar).permit(:supercar_url, :make_id, :car_model_id, :city_id, :country_id)
	end
	def make_params
	 # params.require(:make).permit(:name, { tag_list: [] }, :parse => true).permit!
	 params.require(:make).permit(:name)
	end
	def car_model_params
	 # params.require(:car_model).permit(:name, { tag_list: [] }, :parse => true).permit!
	 params.require(:car_model).permit(:name)
	end
	def city_params
	 params.require(:city).permit(:name)
	end
	def country_params
	 params.require(:country).permit(:name)
	end
	def spot_type_params
	 # params.require(:spot_type).permit(:name, :tag_list)
	end

	def search_params
    	params.require(:supercar_fields).permit(:make, :car_model, :city, :country)
  	end


	end

