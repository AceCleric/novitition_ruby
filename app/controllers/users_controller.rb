class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_user_login

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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        Wallet.create(credit: 20, user_id: @user.id)
        format.html { redirect_to user_path(@user.id), notice: 'User aangemaakt.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user.id), notice: 'User bewerkt.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
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
  
 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

