class UsersController < ApplicationController
  before_action :authenticate_user! , :only => :index

  def index
    @q = User.search( params[:q] )
    @user_scope = @q.result(:distinct => true)
    @users = @user_scope.paginate( :page => params[:page], :per_page => 20 )
  end

  def show
    @user = User.find(params[:id])
    current = current_user
    unless current == @user or current.admin
      return redirect_to :back, :alert => "Access denied."
    end
  end

end
