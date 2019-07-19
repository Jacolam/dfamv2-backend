class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def edit
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create

    def rando_sharky
      num = rand(1..20)
      shark_url = "https://sadanduseless.b-cdn.net/wp-content/uploads/2018/10/ikea-shark#{num}.jpg"
    end

    @user = User.create(user_params)
    @user[:avatar] = rando_sharky
    @user.save

    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update_profile
    arr = ['username', 'phone', 'email', 'avatar', 'twitter', 'facebook' ]
    arr.each do |a|
      current_user.update( a => params[a] )
    end
  end


  def unadded
    @users = User.where.not(id: current_user.id)
    @contacts = current_user.contactees
    @unadded = @users.select{|user| !@contacts.include?(user)}
    render json: @unadded
  end

  def destroy
    current_user.destroy
  end

 # for development
  # def index
  #   @users = User.all
  #   render json: @users
  # end

  private

  def user_params
    params.permit(:username, :password)
  end

end
