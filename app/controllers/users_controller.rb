class UsersController < ApplicationController
  before_action :get_user, except: [ :index ]
  before_filter :authenticate_user!, except: [ :show  ]
  before_filter :visible_user, only: [ :show ]

  def index
    @users = User.where(:visible).order('username ASC')
  end

  def show
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
        flash[:error] = "User #{params[:id]} does not exist, or is a private user."
        redirect_to root_url unless current_user && (current_user == @user || current_user.admin?)
      end
    end
end