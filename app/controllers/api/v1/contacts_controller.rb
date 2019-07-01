class Api::V1::ContactsController < ApplicationController

  def create
    byebug
  end

  private

  def contact_params
    params.permit(:username)
  end

end
