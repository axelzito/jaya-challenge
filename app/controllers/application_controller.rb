# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def authenticate_username(username)
    username == ENV['LOGIN']
  end

  def authenticate_password(password)
    password == ENV['PASSWORD']
  end

  def error_message(msg)
    render(status: 401, json: msg)
  end
end
