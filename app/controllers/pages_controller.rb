class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]

  def home
  end

  def index
    @applications = Application.all
    @jobs = Job.all
  end

end
