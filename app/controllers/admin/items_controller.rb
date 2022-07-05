class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end


  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :genre_id, :name ,:introduction, :price, :is_active)
  end
end
