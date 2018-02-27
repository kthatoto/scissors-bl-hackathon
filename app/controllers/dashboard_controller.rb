class DashboardController < ApplicationController

  def index
  end

  def tutor
    @user_met = current_user.meeting?
  end
end
