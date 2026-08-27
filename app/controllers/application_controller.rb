class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_gym_info

  helper_method :current_user, :logged_in?, :authenticate_user!

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    return if logged_in?

    redirect_to login_path, alert: "Devi effettuare l'accesso per continuare."
  end

  def set_gym_info
    # Rails cerca i dati nella cache con la chiave 'gym_info_global'
    # Se non li trova, esegue la query e salva il risultato nella cache
    @gym_info = Rails.cache.fetch("gym_info_global", expires_in: 24.hours) do
      GymInfo.first
    end
  end
end
