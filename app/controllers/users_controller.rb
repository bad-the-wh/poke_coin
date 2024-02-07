class UsersController < ApplicationController
  before_action :authenticate_user!

  def add_money
    # Logic to show the screen to add money to the wallet
    current_user.update(wallet_balance: current_user.wallet_balance + params[:amount].to_i)
    redirect_to root_path, notice: 'Wallet recharged successfully!'
  end

  def recharge_wallet
    # Logic to add money to the wallet
    current_user.update(wallet_balance: current_user.wallet_balance + params[:amount].to_i)
    redirect_to root_path, notice: 'Wallet recharged successfully!'
  end

  def transactions
    @user_transactions = current_user.transactions
  end
end
