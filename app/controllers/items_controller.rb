class ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_collection, except: [:index]
    before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    def index
        @items = Item.all
        @collection = current_user.collections.first # Assuming you want to show items from the first collection of the current user
    end

    # GET /items/:id
    def show
        @item = Item.find(params[:id])
    end
  
    # GET /collections/:collection_id/items/new
    def new
        @item = @collection.items.build
    end
      
  
    # GET /collections/:collection_id/items/1/edit
    def edit
    end
  
    # POST /collections/:collection_id/items
    def create
        @item = @collection.items.build(item_params)
        if @item.save
          redirect_to @collection, notice: 'Item was successfully created.'
        else
          render :new
        end
    end
  
    # PATCH/PUT /collections/:collection_id/items/1
    def update
      if @item.update(item_params)
        redirect_to [@collection, @item], notice: 'Item was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /collections/:collection_id/items/1
    def destroy
      @item.destroy
      redirect_to collection_items_url(@collection), notice: 'Item was successfully destroyed.'
    end
  
    private

    def set_collection
        @collection = Collection.find(params[:collection_id])
    end

    def item_params
        params.require(:item).permit(:name, :description, :category, :image)
    end
  
    def set_item
        @item = @collection.items.find(params[:id])
    end
    

end
  