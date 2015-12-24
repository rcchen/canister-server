class Api::V1::PhotosController < ApplicationController
  before_action :authorize

  def index
    render json: Photo.find_by_user_id(@user.id)
  end

  def create
    p = Photo.new
    p.photo = params[:photo]
    p.user = @user
    if p.save
      render json: p
    else
      head :bad_request
    end
  end

  private

  def photo_params
    params.permit(:photo)
  end
end
