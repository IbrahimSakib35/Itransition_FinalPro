class CollectionsController < ApplicationController

    before_action :set_collection, only: [:show, :edit, :update, :destroy]
  
    # GET /collections
    def index
      @collections = current_user.collections
    end
  
    def show
        @collection = Collection.find(params[:id])
        @items = @collection.items
    end
  
    # GET /collections/new
    def new
      @collection = current_user.collections.build
      @categories = Collection::CATEGORIES
    end
  
    def edit
      @categories = Collection::CATEGORIES
    end
  
    def create
      @collection = current_user.collections.build(collection_params)
      @categories = Collection::CATEGORIES
      if @collection.save
        redirect_to @collection, notice: 'Collection was successfully created.'
      else
        render :new
      end
    end
  
    def update
      @categories = Collection::CATEGORIES
      if @collection.update(collection_params)
        redirect_to @collection, notice: 'Collection was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /collections/1
    def destroy
      @collection.destroy
      redirect_to collections_url, notice: 'Collection was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "Collection not found."
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:name, :description, :category)
    end
end
  