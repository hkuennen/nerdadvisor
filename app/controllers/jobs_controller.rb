class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      sql_query = "(city ILIKE :query OR title ILIKE :query)"
      @jobs = Job.where(sql_query, query: "%#{params[:query]}%")
    else
      @jobs = Job.all
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
