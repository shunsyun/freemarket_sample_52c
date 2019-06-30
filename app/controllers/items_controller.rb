
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

  def delete
  end

  def mypage
  end

  def show
  end

  def sell
  end

  private
  def create_params
    params.require(:item).permit(:name,:price,:description,:status).merge(image_id: params[:image_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end

