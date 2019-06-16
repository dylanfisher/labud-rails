class ApplicationController < ActionController::Base
  before_action :http_authenticate

  private

    def http_authenticate
      unless Rails.env.development?
        authenticate_or_request_with_http_basic do |username, password|
          username == Rails.application.credentials.dig(:http_auth_user) && password == Rails.application.credentials.dig(:http_auth_password).to_s
        end
      end
    end
end
