class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to "/feed"
    end
  end
end
