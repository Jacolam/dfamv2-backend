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
    render json: current_user
  end

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
