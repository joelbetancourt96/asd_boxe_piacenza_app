class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_gym_info

  private

  def set_gym_info
    @gym_info = GymInfo.first
  end
end
