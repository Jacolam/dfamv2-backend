class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def contacts
    current_user.contactees.each do |contact|
      comb_logs = (contact.inverse_logs + contact.logs)
        # inv_logs = contact.inverse_logs
        # # logs = contact.logs
      calls = comb_logs.select{|log| log.log_type==false}
      call_dates = comb_logs.map{|log| log.datetime}
      call_cycle = current_user.contacts.where(contactee_id: contact.id).first.call_cycle
      if !call_dates.empty?
        call_date = call_dates.sort()
        nearest_call = call_dates.find{|i| ( i[0,10].to_date - Date.today).to_i >= 0 }
        if (nearest_call && nearest_call[0,10].to_date - Date.today).to_i >= call_cycle ||
          Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + call_cycle, log_type: true)
          else if !nearest_call
            Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + call_cycle, log_type: true)
          end
        end
      else
        byebug
        Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + call_cycle, log_type: true)
      end

    end
    render json: current_user
  end
  # time_since_last_call > call_cycle ? Log.create(user_id:current_user.id , attendee_id: contact.id )
  # meet_ups = comb_logs.select{|log| log.log_type==true}
  # meet_dates = comb_logs.map{|log| log.datetime}
  # if !meet_dates.empty?
  #   time_since_last_meet =  (meet_dates.min[0,10].to_date - Date.today).to_i
  # end
  # meet_cycle = current_user.contacts.where(contactee_id: contact.id).first.meet_cycle

  def unadded
    @users = User.where.not(id: current_user.id)
    @contacts = current_user.contactees
    @unadded = @users.select{|user| !@contacts.include?(user)}
    render json: @unadded
  end


 # for development
  def index
    @users = User.all
    render json: @users
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
