class Api::V1::ContactsController < ApplicationController

  def create
    @contactee = User.find_by(username: contact_params['username'])
    Contact.create(user_id: current_user.id, contactee_id: @contactee.id)
    render json: @contactee
  end

  def destroy
    contact = current_user.contacts.where(contactee_id: params['id']).first
    contact.destroy()
    contacts_logs = current_user.logs.where(attendee_id: contact.contactee_id)
    contacts_logs.destroy_all()
    render json:{message:'user has been removed from contacts'}
  end

  def index
    current_user.contactees.each do |contact|

      comb_logs = (contact.inverse_logs.where(user_id: current_user.id) + contact.logs.where(attendee_id: current_user.id))
      calls = comb_logs.select {|log| log.log_type==true}
      call_dates = calls.map{|log| log.datetime}
      call_cycle = current_user.contacts.where(contactee_id: contact.id).first.call_cycle

      if !call_dates.empty?
        call_date = call_dates.sort()
        nearest_call = call_dates.find{|i| ( i[0,10].to_date - Date.today).to_i >= 0 }
        if (nearest_call && nearest_call[0,10].to_date - Date.today).to_i > call_cycle
          Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + call_cycle, log_type: true)
          else if !nearest_call
            Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + call_cycle, log_type: true)
          end
        end

        else if call_dates.empty?
          Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + call_cycle, log_type: true)
        end

      end

      meet_ups = comb_logs.select{|log| log.log_type==false}
      meet_dates = meet_ups.map{|log| log.datetime}
      meet_cycle = current_user.contacts.where(contactee_id: contact.id).first.meet_cycle

      if !meet_dates.empty?
        meet_date = meet_dates.sort()
        nearest_meet = meet_dates.find{|i| ( i[0,10].to_date - Date.today).to_i >= 0 }
        if (nearest_meet && nearest_meet[0,10].to_date - Date.today).to_i > meet_cycle
          Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + meet_cycle)
          else if !nearest_meet
            Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + meet_cycle)
          end
        end

        else if meet_dates.empty?
          Log.create(user_id: current_user.id, attendee_id: contact.id, datetime: Date.today + meet_cycle)
        end

      end

    end
    render json: current_user
  end

  private

  def contact_params
    params.permit(:username)
  end

end
