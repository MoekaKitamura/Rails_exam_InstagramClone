class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
  skip_before_action :login_required, only: [:index, :show]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  def favorite
    
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def edit
    redirect_to pictures_path unless same_user?
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to @picture, notice: "Your post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "Your post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: "Your post was successfully deleted."
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content, :user_id)
  end
end