class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , :only => [:index , :edit , :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @q = Song.search( params[:q] )
    @song_scope = @q.result(:distinct => true)
    @songs = @song_scope.paginate( :page => params[:page], :per_page => 20 )
    tag_used
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
        tag_given
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
        tag_given
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    unless current_user.admin
      return redirect_to :back, :alert => "Access denied."
    end
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def tag_used
      user = current_user
      user.used = Date.today
      user.count += 1
      user.save!
    end

    def tag_used
      user = current_user
      user.given = Date.today
      user.count = 0
      user.save!
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist, :album, :speed, :genre, :link, :info)
    end
end
