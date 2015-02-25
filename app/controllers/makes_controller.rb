class MakesController < ApplicationController
	# before_action :tag_cloud

	def allmodels
	if params[:name]
	    @makes = Make.find(params[:name])
	    	    binding.pry

	    @supercars = @makes.supercars.all.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")
	  else
	    @makes = Make.find(params[:name])
	    # render :allmakes
	    binding.pry
	    @supercars = @makes.supercars.all.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")

	  end
	end

	def index
		@makes = Make.all
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


