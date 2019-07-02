class Api::V1::ContactsController < ApplicationController

  def create
    @contactee = User.find_by(username: contact_params['username'])
    Contact.create(user_id: current_user.id, contactee_id: @contactee.id)
    render json: @contactee
  end

  def destroy
    contact = current_user.contacts.where(contactee_id: params['id']).first
    contact.destroy()
    render json:{message:'user has been removed from contacts'}
  end

  def edit
    byebug
  end

  private

  def contact_params
    params.permit(:username)
  end

end
