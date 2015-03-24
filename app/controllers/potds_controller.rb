class PotdsController < ApplicationController

before_filter :require_admin!
  
  def new
    @potd = Potd.new
  end

  def create
    @potd = Potd.new(potd_params)  

      if @potd.save
        redirect_to supercars_url
      else
        render :new
      end

  end

  private

  def potd_params
   params.require(:potd).permit(:supercar_url, :make, :car_model, :city, :country)
  end

end