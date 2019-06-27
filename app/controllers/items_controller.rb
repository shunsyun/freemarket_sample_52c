
class ItemsController < ApplicationController

  def index
    @ladies = Item.recent
    @mens = Item.recent.where(category_id:2)
    @babies = Item.recent.where(category_id:3)
    @cosmes =Item.recent.where(category_id:4)
    @chanels =Item.recent.where(brand_id:1)
    @louis =Item.recent.where(brand_id:2)
    @supremes =Item.recent.where(brand_id:3)
    @nikes =Item.recent.where(brand_id:4)
  end

  def new
    @item = Item.new
    @item.images.build
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

  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:delivery_days,:delivery_charge,:prefecture,images_attributes:[:text],brand_attributes:[:name])
    # .merge(seller_id:current_user.id)
  end

end

