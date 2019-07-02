
class ItemsController < ApplicationController
  # before_action :authenticate_user!, only:[:index,:show]
  before_action :move_to_sign_in,except: [:index,:show]
  before_action :set_search
  before_action :set_item,except: [:edit,:show,:buy]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)

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
  
  def destroy
    item = Item.find(params[:id])
    if item.seller_id == current_user.id
      item.destroy
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    if item.seller_id == current_user.id
      item.update(item_params)
      redirect_to item_path
    end
  end

  def mypage
  end

  def show
    @next_item = Item.where("id > ?", @item.id).order("id ASC").first
    @prev_item = Item.where("id < ?", @item.id).order("id DESC").first
  end

  def sell
  end

  def buy
  end

  def search
    @q = Item.ransack(search_params)
    @items = @q.result(distinct: true)
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:image,:status,:delivery_days,:delivery_charge,:prefecture,:children,:grandchildren,:category_l,:size,:brand,:sales_status).merge(seller_id:current_user.id)
  end

  def move_to_sign_in
    redirect_to sign_in_path unless user_signed_in?
  end
  # images_attributes:[:text]

  def search_params
    params.require(:q).permit(:name_cont)
  end

  def set_search
    @q = Item.search(params[:q])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

