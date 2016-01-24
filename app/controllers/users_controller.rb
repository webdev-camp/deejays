class UsersController < ApplicationController
  before_action :authenticate_user! , :only => :index

  def index
    @users = User.all
  end

  def show
    @user = current_user
    show = User.find(params[:id])
    puts @user.inspect
    unless show == @user or (@user.email == "sanctuarydance@aol.com")
      redirect_to :back, :alert => "Access denied."
    end
  end

end
