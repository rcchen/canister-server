class Api::V1::TokensController < ApplicationController
  before_action :authorize

  def index
    render json: Token.find_by_user_id(@user.id)
  end
end
