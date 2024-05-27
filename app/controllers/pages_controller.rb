# app/controllers/pages_controller.rb

class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:blocked]
    skip_before_action :check_blocked_user, only: [:blocked]
  
    def blocked
    end
end
  