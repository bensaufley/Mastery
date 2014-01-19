class UsersController < ApplicationController
  before_action :get_user, except: [ :index ]
  before_filter :authenticate_user!, except: [ :show  ]
  before_filter :visible_user, only: [ :show ]

  layout 'static'

  def index
    @users = User.where(:visible).order('username ASC')
  end

  def show
    layout 'jumbotron'
    if @user == current_user
      redirect_to root_url
    end
  end

  def destroy
    if @user == current_user || current_user.try(:admin?)
      @user.destroy
      respond_to do |format|
        format.html { redirect_to activities_url }
        format.json { head :no_content }
      end
    else
      flash[:error] = 'You are not authorized to delete ' + link_to(@user.username, user)
      redirect_to current_user
    end
  end

  private
    def get_user
      @user = User.find_by(username: params[:id])
    end
    def visible_user
      if !@user.try(:visible?)
        flash[:error] = "User <strong>#{params[:id]}</strong> does not exist, or is a private user.".html_safe
        redirect_to root_url unless current_user && (current_user == @user || current_user.admin?)
      end
    end
end
