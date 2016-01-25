class UsersController < ApplicationController
  before_action :authenticate_user! , :only => :index
  before_action :check_user , :only => [:show , :edit , :update]

  def index
    @q = User.search( params[:q] )
    @user_scope = @q.result(:distinct => true)
    @users = @user_scope.paginate( :page => params[:page], :per_page => 20 )
  end

  def check_user
    @user = User.find(params[:id])
    current = current_user
    unless current == @user or current.admin
      return redirect_to :back, :alert => "Access denied."
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path , notice: 'Info successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        tag_given
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :info, :link,:city , :country)
  end

end
