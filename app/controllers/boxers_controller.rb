class BoxersController < ApplicationController
  def index
    @boxers = Profile.where(profile_type: :atleta_agonista)
      .with_attached_profile_image
      .includes(:athlete_detail)
      .map do |profile|
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
          # is_pro: athlete_detail&.is_pro || false,
          image_url: profile_image_url(profile)
        }
      end

    respond_to do |format|
      format.html
      format.json { render json: @boxers }
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
