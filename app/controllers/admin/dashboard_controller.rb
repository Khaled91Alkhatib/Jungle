class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV["BASIC_AUTH_CREDENTIALS_USERNAME"], password: ENV["BASIC_AUTH_CREDENTIALS_PASSWORD"]

  def show
  end
end
