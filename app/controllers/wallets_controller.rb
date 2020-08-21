class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[show edit update destroy]

  def index
    @wallets = Wallet.all
  end

  def show
  end

  def new
    @wallet = Wallet.new
  end

  def edit
  end

  def create
    @wallet = Wallet.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to @wallet, notice: 'Customer Wallet was successfully created.' }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to "/users/#{@wallet.user_id}", notice: 'Customer Wallet was successfully updated.' }
      else
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to wallets_url, notice: 'Customer Wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end

  def set_wallets
    @wallets = parent.art_piece
  end

  def wallet_params
    params.require(:wallet).permit(:credit, :user_id, :add_credit, :remove_credit)
  end
end