class SupercarsController < ApplicationController

	def index	 
		@supercars = Supercar.all.paginate(:page => params[:page], :per_page => 9).order("created_at DESC")
		@make = Make.order('name asc').all
		@car_model = CarModel.order('name asc').all
		@city = City.order('name asc').all
		@country = Country.order('name asc').all
	end

	def new
		@supercar = Supercar.new
		@supercar.make = Make.new
		@supercar.car_model = CarModel.new
		@supercar.city = City.new
		@supercar.country = Country.new
		# @supercar.spot_type = SpotType.new
	end

	# def show
	# 	@supercar = Supercar.find(params[:id])

	# 	if current_user
			
	# 	end
	# end

	def edit
  		@supercar = Supercar.find(params[:id])
	end

	# def update
	#   @supercar = Supercar.find(params[:id])
	#   @supercar.update(supercar_params)
	#   @supercar.make.update(make_params)

	#   @supercar.car_model.update(car_model_params)

	#   @supercar.city.update(city_params)
	#   @supercar.country.update(country_params)
	#   # @supercar.spot_type.update(spot_type_params)

	#     if @supercar.update_attributes(supercar_params)
	#       flash[:success] = "Supercar updated"
	#       redirect_to @supercar
	#     else
	#       render 'edit'
	#     end
	# end


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
	 params.require(:supercar).permit(:supercar_url)
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

	end

# def search
#     search_params
#     sanitized_search = search_params.delete_if { |k,v| v.blank? }
#     # query = Card.all
#     supercar_query = Supercar.all
#     make_query = Make.all
#     model_query = CarModel.all
#     city_query = City.all
#     country_query = Country.all
#     sanitized_search.each do |key, value|

#       if key == "name" || key == "artist"
#         # if query.class == Array
#         #   query = Card.where(id: query.map(&:id))
#         # end
#         query = query.where(["#{key} iLIKE ?", "%#{value}%"])
#       end

#       if key == "card_set" && value != "All"
#         card_set_query = CardSet.where(["name iLIKE ?", "%#{value}%"]).first.cards
#         query = query.merge(card_set_query)
#         # query = [query, card_set_query].inject(&:&)
#       end

#       if key == "cmc"
#         num = value.to_i
#         cmcmod = sanitized_search[:cmcmod]
#         # if query.class == Array
#         #   query = Card.where(id: query.map(&:id))
#         # end
#         query = query.where("#{key} #{cmcmod} ?", num)
#       end

#       if key == "card_type"
#         if CardType.where(["name iLIKE ?", "%#{value}%"]).first == nil
#           card_type_query = []
#           # query = [query, subtype_query].inject(&:&)      
#           query = query.merge(card_type_query)
#         else
#           card_type_query = CardType.where(["name iLIKE ?", "%#{value}%"]).first.cards
#           # query = [query, card_type_query].inject(&:&)
#           query = query.merge(card_type_query)
#         end
#       end

#       if key == "subtypes"
#         values = value.gsub(/\s+/, "").split(",")
#         subtype_query = []
#         values.each do |subtype|
#           if Subtype.where(["name iLIKE ?", "%#{subtype}%"]).first == nil
#             subtype_query = []
#             # query = [query, subtype_query].inject(&:&)
#             query = query.merge(subtype_query)
#           else
#             subtype_query = Subtype.where(["name iLIKE ?", "%#{subtype}%"]).first.cards
#             # query = [query, subtype_query].inject(&:&)
#             query = query.merge(subtype_query)
#           end
#         end
#       end

#       if key == "white" && value == "1"
#         color_query = Color.where(name: "White").first.cards
#         # query = [query, color_query].inject(&:&)
#         query = query.merge(color_query)
#       end

#       if key == "blue" && value == "1"
#         color_query = Color.where(name: "Blue").first.cards
#         # query = [query, color_query].inject(&:&)
#         query = query.merge(color_query)
#       end

#       if key == "black" && value == "1"
#         color_query = Color.where(name: "Black").first.cards
#         # query = [query, color_query].inject(&:&)
#         query = query.merge(color_query)
#       end

#       if key == "red" && value == "1"
#         color_query = Color.where(name: "Red").first.cards
#         # query = [query, color_query].inject(&:&)
#         query = query.merge(color_query)
#       end

#       if key == "green" && value == "1"
#         color_query = Color.where(name: "Green").first.cards
#         # query = [query, color_query].inject(&:&)
#         query = query.merge(color_query)
#       end

#     end
#     # convert query back into Active Record object 
#     # if query.class == Array    
#     #   query = Card.where(id: query.map(&:id))
#     # end

#     query.page(params[:page])
#   end