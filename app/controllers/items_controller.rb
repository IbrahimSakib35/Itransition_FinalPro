class ItemsController < ApplicationController
  before_action :set_collection, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:collection_id]
      @items = current_user.collections.find(params[:collection_id]).items
    else
      @items = Item.joins(:collection).where(collections: { user_id: current_user.id })
    end
  end
  def show
  end
  def new
    @item = Item.new
  end
  def edit
  end
  def create
    @collection = current_user.collections.find(item_params[:collection_id])
    @item = @collection.items.build(item_params)
    if @item.save
      redirect_to collection_item_path(@collection, @item), notice: 'Item was successfully created.'
    else
      render :new
    end
  end
  def update
    @collection = current_user.collections.find(item_params[:collection_id])

    if @item.update(item_params)
      redirect_to collection_item_path(@collection, @item), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to collection_items_path(@collection), notice: 'Item was successfully destroyed.'
  end

  private
    def set_collection
      @collection = Collection.find(params[:collection_id])
    rescue ActiveRecord::RecordNotFound
      @collection = nil
    end
    def set_item
      @item = @collection.items.find(params[:id])
    end
    
    def item_params
      params.require(:item).permit(:name, :tags, :collection_id)
    end
end
