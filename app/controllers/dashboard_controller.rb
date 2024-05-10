class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index

    dashboard = Dashboard.new()
    @dashboardData = dashboard.construct_dashboard(user: current_user)
  end
end