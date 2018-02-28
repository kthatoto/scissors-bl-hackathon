class DashboardController < ApplicationController

  def index
  end

  def tutor
    @user_met = current_user.meeting?
    @car = current_user.car.nil? ? Car.new : current_user.car
  end
  def student
    @user_met = current_user.meeting?
  end
end
