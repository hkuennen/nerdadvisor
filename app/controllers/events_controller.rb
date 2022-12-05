class EventsController < ApplicationController
  before_action :set_user
  before_action :set_event, only: [:destroy]

  def index
    @events = Event.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url("marker.png")
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @event.user_id = current_user.id
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = @user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :desc, :venue, :address, :user_id)
  end

  def set_user
    @user = current_user
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
