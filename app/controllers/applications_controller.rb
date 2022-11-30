class ApplicationsController < ApplicationController
  before_action :set_user
  before_action :set_job, only: [:index, :new, :create]
  before_action :set_application, only: [:destroy]

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @application.user_id = current_user.id
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = @user
    @application.job = @job
    if @application.save
      redirect_to job_application_path(@application.job_id, @application.id), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @application.destroy
    redirect_to pages_path, status: :see_other
  end


  private

  def application_params
    params.require(:application).permit(:user_id, :job_id)
  end

  def set_user
    @user = current_user
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_application
    @application = Application.find(params[:id])
  end
end
