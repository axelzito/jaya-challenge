# frozen_string_literal: true

module AuthHelper
  def http_login(username, password)
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
    request.env['HTTP_AUTHORIZATION'] = credentials
  end
end
