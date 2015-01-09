class AlbumsController < ApplicationController
  before_action :require_login_user!

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new, album: @album
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ["Update failed"]
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private
  def album_params
    params.require(:album).permit(:name, :album_type, :band_id)
  end
end
