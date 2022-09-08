class ApplicationController < ActionController::Base
  # @current_user = User.first
  def current_user
    @current_user = User.first
  end
end
