class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    user = get_user_from_token
    render json: {
      message: "If you see this, you're in!",
      user: user
    }
  end

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

  private

  def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end

end
