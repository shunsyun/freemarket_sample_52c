class ItemsController < ApplicationController
  def index
    @ladies = Item.recent.where(category_id:1)
    @mens = Item.recent.where(category_id:2)
    @babies = Item.recent.where(category_id:3)
    @cosmes =Item.recent.where(category_id:4)
    @chanels =Item.recent.where(category_id:5)
    @louis =Item.recent.where(category_id:6)
    @supremes =Item.recent.where(category_id:7)
    @nikes =Item.recent.where(category_id:8)
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

  private
  def create_params
    params.require(:item).permit(:name,:price,:description,:status).merge(image_id: params[:image_id])
  end

end

