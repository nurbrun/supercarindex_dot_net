class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find_by_username(params[:id])
		@supercars_by_user = @user.supercars.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")
		@supercars_by_user_no_page = @user.supercars

	end

end
