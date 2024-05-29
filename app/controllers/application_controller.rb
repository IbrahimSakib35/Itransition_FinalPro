class ApplicationController < ActionController::Base

    before_action :check_blocked_user
    before_action :set_locale
    before_action :load_common_data
    
  
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  
    def default_url_options
      { locale: I18n.locale }
    end
    

    private
    def load_common_data
      @latest_items = Item.includes(:collection).order(created_at: :desc).limit(10)
      @largest_collections = Collection.left_joins(:items)
                                       .group('collections.id')
                                       .order('COUNT(items.id) DESC')
                                       .limit(5)
    end

    def check_blocked_user
      if current_user && current_user.blocked? && request.path != blocked_path
        redirect_to blocked_path
      end
    end
end
  