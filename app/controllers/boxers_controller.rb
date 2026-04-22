class BoxersController < ApplicationController
  def index
    respond_to do |format|
      format.html # Non esegue alcuna query, carica solo la pagina con Vue.js
      format.json do
        # Eager Loading: una sola query per profili, immagini e dettagli
        profiles = Profile.where(profile_type: :atleta_agonista)
                          .with_attached_profile_image
                          .includes(:athlete_detail)

        @boxers = profiles.map do |profile|
          athlete_detail = profile.athlete_detail
          {
            id: profile.id,
            first_name: profile.first_name,
            last_name: profile.last_name,
            wins: athlete_detail&.wins || 0,
            losses: athlete_detail&.losses || 0,
            draws: athlete_detail&.draws || 0,
            category: athlete_detail&.category || "Unknown",
            weight: athlete_detail&.weight || 0,
            is_pro: athlete_detail&.is_pro,
            nickname: athlete_detail&.nickname,
            image_url: profile_image_url(profile)
          }
        end

        render json: @boxers
      end
    end
  end

  private

  def profile_image_url(profile)
    if profile.profile_image.attached?
      url_for(profile.profile_image)
    else
      "https://via.placeholder.com/300x400?text=#{profile.first_name}+#{profile.last_name}"
    end
  end
end
