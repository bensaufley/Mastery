class InstancesController < ApplicationController
  before_action :set_instance, only: [:show, :update, :destroy]
  before_action :set_activity

  # GET /instances/1
  # GET /instances/1.json
  def show
  end

  # GET/POST /instances/1/stop
  def stop
    respond_to do |format|
      if @instance.stop
        format.html { redirect_to activity_path(@user,@activity), notice: 'Activity was successfully stopped.'}
        format.json { render action: 'show', status: :accepted, location: activity_path(@user,@activity) }
      else
        format.html { redirect_to activity_path(@user,@activity), error: @instance.errors }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /instances
  # POST /instances.json
  def create
    @instance = @activity.instances.new(instance_params)
    Rails.logger.info @instance.attributes

    respond_to do |format|
      if @instance.save
        format.html { redirect_to activity_path(@user,@activity), notice: "Activity was successfully #{@instance.type == 'Timed' ? 'begun' : 'tallied'}." }
        format.json { render action: 'show', status: :created, location: activity_path(@user,@activity) }
      else
        format.html { redirect_to activity_path(@user,@activity), error: @instance.errors }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instances/1
  # PATCH/PUT /instances/1.json
  def update
    respond_to do |format|
      if @instance.update(instance_params)
        format.html { redirect_to activity_path(@user,@activity), notice: 'Activity log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to activity_path(@user,@activity) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end
    def set_activity
      @activity = Activity.find(params[:activity_id])
      @user = @activity.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params[:instance].permit(:type,:started,:done,:private)
    end
end
