class HomeController < ApplicationController
  def index
    # if user_signed_in?
    # @categories = current_user.groups
    # render 'categories/index'
    # else
    render 'home/index'
    # end
  end
end
