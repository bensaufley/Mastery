class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:stop, :show, :edit, :update, :destroy]
  before_action :set_user
  before_filter :authenticate_user!
  layout 'jumbotron', only: [:show]

  # GET /user/:user_id/activities
  # GET /user/:user_id/activities.json
  def index
    @activities = @user.activities.all
  end

  # GET /user/:user_id/activities/1
  # GET /user/:user_id/activities/1.json
  def show

  end

  # GET /user/:user_id/activities/new
  def new
    @activity = Activity.new
    @activity[:type] ||= params[:type]
  end

  # GET /user/:user_id/activities/1/edit
  def edit
  end

  # POST /user/:user_id/activities
  # POST /user/:user_id/activities.json
  def create
    @activity = @user.activities.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@user,@activity), notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT/GET /user/:user_id/activities/1/stop
  def stop
    respond_to do |format|
      if @activity.stop
        format.html { redirect_to activity_url(@user,@activity), notice: 'Activity was successfully stopped.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/:user_id/activities/1
  # PATCH/PUT /user/:user_id/activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@user,@activity), notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/:user_id/activities/1
  # DELETE /user/:user_id/activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id] || params[:activity_id])
    end

    def set_user
      @user = User.find_by(username: params[:username])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :type, :private, :user_id)
    end
end
