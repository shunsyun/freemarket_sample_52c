class ItemsController < ApplicationController
  # before_action :set_category

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
  # def delete
  # end

  # def mypage
  # end
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

  def show
  end

  def sell
  end

  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:image_id,images_attributes:[:text])
    # .merge(user_id:current_user.id)
  end

  # def image_params
  #   params.require(:image).permit(:text).merge(item_id:item.id)
  # end

  # def set_category
  #   @category = Category.find(params[:category_id])
  # end

end
