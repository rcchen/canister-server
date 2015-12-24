class ApplicationController < ActionController::API

  protected

  def authorize
    pattern = /^Bearer /
    header = request.headers["Authorization"]
    access_token = header.gsub(pattern, '') if header && header.match(pattern)
    token = Token.find_by_access_token(access_token)
    if (token)
      @user = token.user
    else
      head :unprocessable_entity
    end
  end
end
