class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_blocked_user
    before_action :set_locale
    
  
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  
    def default_url_options
      { locale: I18n.locale }
    end
    

    private

    def check_blocked_user
      if current_user && current_user.blocked? && request.path != blocked_path
        redirect_to blocked_path
      end
    end
end
  