module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    def index
      # You can add dashboard stats here later
    end

    private

    def require_admin
      redirect_to root_path, alert: "Access denied" unless current_user.role == "admin"
    end
  end
end
