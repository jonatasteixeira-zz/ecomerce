class UsersController < ApplicationController

  before_action :authorize, only: [:index, :update, :destroy]

  # GET /signup
  def new
  	@user = User.new
  end

  # POST /users
  def create
    user = User.new(user_params)
	if user.save
      session[:user_id] = user.id
      redirect_to root_url, :flash => { :success => "Signed up!" }
    else
      redirect_to '/signup', :flash => { :error => "Something was wrong! =(" } 
    end
  end

  # GET /users
  def index
    @users = User.all
  end

  # POST /users/update
  def update
  	if checkbox_admin.nil?
      redirect_to users_path, :flash => { :error => "You have to keep some user as administrator" }
    else
      @users = User.all
      @users.each do |user|
  	    user.admin = checkbox_admin.include?(user.id.to_s)
        user.save
      end
      redirect_to users_path, :flash => { :success => "Saved!" }
  	end
  end

  # DELETE /users/:id
  def destroy
  	admins = User.where(:admin => true)
  	user = User.find(id_param)
  	if admins.count > 1 or not admins.include?(user)
  	  user.destroy
      redirect_to users_path, :flash => { :success => "The user was removed successfully!" }
    else
      redirect_to users_path, :flash => { :error => "You have to keep some user as administrator" }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def checkbox_admin    
	params.require(:checkbox_admin) if params.include?(:checkbox_admin) 
  end

  def id_param
  	params.require(:id)
  end
end