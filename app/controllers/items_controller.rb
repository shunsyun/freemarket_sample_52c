
class ItemsController < ApplicationController
  # before_action :authenticate_user!, only:[:index,:show]
  before_action :move_to_sign_in,except: [:index,:show]
  def index
    @ladies = Item.recent.where(category_l:1)
    @mens = Item.recent.where(category_l:2)
    @babies = Item.recent.where(category_l:3)
    @cosmes = Item.recent.where(category_l:4)
    @chanels = Item.recent.where(brand:"シャネル")
    @louis = Item.recent.where(brand:"ルイヴィトン")
    @supremes = Item.recent.where(brand:"シュプリーム")
    @nikes = Item.recent.where(brand:"ナイキ")
  end

  def new
    @item = Item.new
    # @item.images.build
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save 
      redirect_to root_path
    else
      render :new
    end
  end
  
  def delete
  end

  def mypage
  end

  def show
    @item = Item.find(params[:id])
  end

  def sell
  end

  def buy
    @item = Item.find(params[:id])
  end

  def buy_done
    # @item = Item.find(params[:id])
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(currency: 'jpy', amount: item.price, card: params['payjp-token'])
    redirect_to items_buy_done_path, notice: "支払いが完了しました"
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:image,:status,:delivery_days,:delivery_charge,:prefecture,:category_l,:size,:brand,:trade_status).merge(seller_id:current_user.id)
  end

  def move_to_sign_in
    redirect_to sign_in_path unless user_signed_in?
  end
  # images_attributes:[:text]
end

