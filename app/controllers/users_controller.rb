class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_user_login, only: %i[index destroy edit update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @disable_score_fields = true 
  end

  def edit
  end

  def create
    @user = User.new(users_params)

    respond_to do |format|
      if @user.save
        Wallet.create(credit: 20, user_id: @user.id)
        format.html { redirect_to root_path, notice: 'User created, please login.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { 
          redirect_to root_path(show_signup: true), notice: 'Failed creating a user'
        }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(current_user.id), notice: 'Updated user.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { 
          redirect_to profile_path(current_user.id), notice: 'Failed updating a user'
        }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @users = parent.user
  end
 
  def users_params
    params.require(:users).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

