class ItemsController < ApplicationController
  def index
  end

  def delete
  end

  def mypage
  end

  def show
  end

  def sell
  end

  def buy
  end

  def buy_done
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(currency: 'jpy', amount: 9000, card: params['payjp-token'])
    redirect_to items_buy_done_path, notice: "支払いが完了しました"
  end

end

