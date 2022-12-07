class AttendeesController < ApplicationController
  before_action :set_user
  before_action :set_event, only: [:index, :new, :create]
  before_action :set_attendee, only: [:destroy]


  def index
    @attendees = Attendee.all
  end

  def show
    @attendee = Attendee.find(params[:id])
    @attendee.user_id = current_user.id
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.user_id = @user.id
    @attendee.job_id = @job.id
    @attendee.employer_id = @job.employer.id
    render :new, status: :unprocessable_entity

    # if @attendee.save
    #   redirect_to job_application_path(@attendee.job_id, @application.id), status: :see_other
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def attendee_params
    params.require(:attendee).permit(:user_id, :event_id)
  end

  def set_user
    @user = current_user
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
