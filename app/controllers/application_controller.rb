class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_gym_info

  private

  def set_gym_info
    # Rails cerca i dati nella cache con la chiave 'gym_info_global'
    # Se non li trova, esegue la query e salva il risultato nella cache
    @gym_info = Rails.cache.fetch("gym_info_global", expires_in: 24.hours) do
      GymInfo.first
    end
  end
end
