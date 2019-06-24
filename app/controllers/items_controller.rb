class ItemsController < ApplicationController
  # before_action :set_category

  def index
    @item = Item.new
    @ladies = Item.recent.where(category_id:1)
    @mens = Item.recent.where(category_id:2)
    @babies = Item.recent.where(category_id:3)
    @cosmes =Item.recent.where(category_id:4)
    @chanels =Item.recent.where(brand_id:1)
    @louis =Item.recent.where(brand_id:2)
    @supremes =Item.recent.where(brand_id:3)
    @nikes =Item.recent.where(brand_id:4)
  end
  # def delete
  # end

  # def mypage
  # end

  def show
  end

  def sell
  end

  def buy
  end


  def buy_done
  end

  def pay
    Payjp.api_key = 'sk_test_54f5aa6a22e2669cdb4b1111'
    Payjp::Charge.create(currency: 'jpy', amount: 9000, card: params['payjp-token'])
    redirect_to items_buy_done_path, notice: "支払いが完了しました"
  end
  
  private
  def create_params
    params.require(:item).permit(:name,:price,:description,:status).merge(image_id: params[:image_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end

