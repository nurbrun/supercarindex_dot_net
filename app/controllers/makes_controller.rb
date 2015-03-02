class MakesController < ApplicationController

	# def allmodels
	# if params[:name]
	#     @makes = Make.find(params[:name])
	#     @supercars = @makes.supercars.all.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")
	#   else
	#     @makes = Make.find(params[:name])
	#     # render :allmakes
	#     binding.pry
	#     @supercars = @makes.supercars.all.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")

	#   end
	# end

	def index
		@makes = Make.all
	end

	def show
		@make = Make.find_by_name(params[:id])
		@supercars_by_make = @make.supercars.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")	
	end

	

  # def tag_cloud
  #   @tags = CarModel.tag_counts_on(:tags)
  # end

  # def tag
  #   @makes = Make.tagged_with(params[:name])
  #   @makes = Make.tag_counts_on(:tags)
  #   render :action => 'index'

  # end
end


