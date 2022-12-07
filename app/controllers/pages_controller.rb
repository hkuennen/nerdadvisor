class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]
  before_action :set_user


  def home
  end

  def index
    @applications = Application.all
    @jobs = Job.all
  end

  private

  def set_user
    @user = current_user
  end

end
