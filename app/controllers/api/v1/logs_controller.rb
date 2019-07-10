class Api::V1::LogsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @log = Log.create(log_params)
    @log[:user_id] = current_user.id
    @log.save
    if @log.valid?
      render json: @log, status: :created
    else
      render json: { error: 'failed to create log' }, status: :not_acceptable
    end
  end

  def complete
    log = Log.find(params[:id])
    log[:completed] = !log[:completed]
    log.save
    render json: log
  end

  def update
     log = Log.find(params[:id])
     log.update(datetime: params[:date] + " " + params[:time] )
     render json: log
  end

  def index
    @logs = Log.all
    render json:@logs
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
  end

  private

  def log_params
    params.permit(:attendee_id, :log_type, :datetime)
  end

end
