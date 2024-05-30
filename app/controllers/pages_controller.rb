class PagesController < ApplicationController
    skip_before_action :check_blocked_user, only: [:blocked]

    def blocked
    end
end
  