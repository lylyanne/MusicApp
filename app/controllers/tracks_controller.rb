class TracksController < ApplicationController
  before_action :require_login_user!

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    @track.album_id = params[:album_id]
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new, track: @track
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private
  def track_params
    params.require(:track).permit(:song_title, :track_type, :album_id, :lyric)
  end
end
