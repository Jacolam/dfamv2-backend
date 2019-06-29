class Api::V1::LogsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def create
    @log = Log.create(log_params)
    @log['user_id'] = current_user.id
    @log.save
    # byebug
    if @log.valid?
      render json: @log, status: :created
    else
      render json: { error: 'failed to create log' }, status: :not_acceptable
    end
  end

  def index
    @logs = Log.all
    render json:@logs
  end

  private

  def log_params
    params.permit(:attendee_id, :log_type, :datetime)
  end

end
