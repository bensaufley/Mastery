class StaticPagesController < ApplicationController
  layout 'static'

  def home
    if user_signed_in?
      @user = current_user
      render 'users/show'
    end
  end
end
