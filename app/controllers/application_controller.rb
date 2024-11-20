class ApplicationController < ActionController::API
    def authenticate_request
      token = request.headers['Authorization']
      api_token = ENV['API_TOKEN']
  
      if token.blank? || api_token.blank? || !ActiveSupport::SecurityUtils.secure_compare(token, api_token)
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
