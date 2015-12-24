class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    puts user.save
    if user.save
      head :ok
    else
      head :bad_request
    end
  end

  def authenticate
    user = User.find_by_email(params[:user][:email])
    if user.password == params[:user][:password]
      token = Token.new do |t|
        t.access_token = generate_unique_secure_token
        t.user = user
      end
      if token.save
        render json: token
      else
        head :bad_request
      end
    else
      head :unauthorized
    end
  end

  private

  def generate_unique_secure_token
    SecureRandom.base58(24)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
