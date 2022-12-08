class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]
  skip_before_action :verify_authenticity_token
  before_action :set_user


  def home
  end

  def index
    @applications = Application.where(user: @user)
    @events = Attendee.where(user: @user).pluck(:event_id)
  end

  def levelup
    if params[:levelup].present?
      @user.xp = 0
      @user.level += 1
      @user.levelUp = false
      @user.save
    end
  end

  private

  def set_user
    @user = current_user
  end

end
