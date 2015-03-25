class SupercarsController < ApplicationController

  impressionist :actions=>[:show,:index]

  def index
    
    @potd = Potd.last
    @make = Make.order('name asc').all
    @car_model = CarModel.order('name asc').all
    @city = City.order('name asc').all
    @country = Country.order('name asc').all
    @supercars = search
    @supercars_top_five = Supercar.first(5).reverse

    # @partial = params[:view] || "default", "insta_bird"

  end

  def new
    @supercar = Supercar.new
    @supercar.make = Make.new
    @supercar.car_model = CarModel.new
    @supercar.city = City.new
    @supercar.country = Country.new

    @make = Make.order('name asc').all
    @car_model = CarModel.order('name asc').all
    @city = City.order('name asc').all
    @country = Country.order('name asc').all 

    # @supercar.spot_type = SpotType.new
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

  def show
    @supercar = Supercar.find(params[:id])
    impressionist(@supercar, "wtf...")
  end



  # def show
  #   @supercar = Supercar.find(params[:id])

  #   if current_user
      
  #   end
  # end

  def edit
      @supercar = Supercar.find(params[:id])
  end

  def update
    @supercar = Supercar.find(params[:id])

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

  def search


    fields = {
      :make_id => Make,
      :car_model_id => CarModel,
      :city_id => City,
      :country_id => Country
    }
   
    cars = Supercar.all
    # cars = Supercar.all

    fields.each do |field, model|
      # if query = search_params[field]
      unless params[field].blank?
        # subresults = model.where("name like ?", "%#{query}%")
        subresults = model.find(params[field])
        cars = cars.where(field => subresults)
        # binding.pry
      end
    end

    # cars.page(params[:page])

    cars.paginate(:page => params[:page], :per_page => 16).order("created_at DESC")

  end
end

