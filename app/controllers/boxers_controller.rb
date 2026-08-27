class BoxersController < ApplicationController
  before_action :set_boxer, only: [ :edit, :update ]
  before_action :require_admin!, only: [ :edit, :update ]

  def index
    respond_to do |format|
      format.html # Non esegue alcuna query, carica solo la pagina con Vue.js
      format.json do
        profiles = Profile.where(profile_type: :atleta_agonista)
                          .order(:last_name, :first_name)
                          .with_attached_profile_image
                          .includes(:athlete_detail)

        boxers = profiles.map do |profile|
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
            image_url: profile_image_url(profile),
            edit_path: edit_boxer_path(profile)
          }
        end

        render json: {
          is_admin: admin_user?,
          boxers: boxers
        }
      end
    end
  end

  def edit
    @boxer.build_athlete_detail if @boxer.athlete_detail.nil?
  end

  def update
    if @boxer.update(profile_params)
      redirect_to boxers_path, notice: "Profilo aggiornato con successo."
    else
      @boxer.build_athlete_detail if @boxer.athlete_detail.nil?
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_boxer
    @boxer = Profile.find(params[:id])
  end

  def require_admin!
    return if admin_user?

    redirect_to login_path, alert: "Devi essere amministratore per modificare i pugili."
  end

  def admin_user?
    current_user.present? && current_user.profile.present? && current_user.profile.admin?
  end

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :profile_type,
      :profile_image,
      athlete_detail_attributes: [
        :id,
        :fpi_card_id,
        :wins,
        :draws,
        :losses,
        :weight,
        :category,
        :is_pro,
        :nickname
      ]
    )
  end

  def profile_image_url(profile)
    if profile.profile_image.attached?
      url_for(profile.profile_image)
    else
      "https://via.placeholder.com/300x400?text=#{profile.first_name}+#{profile.last_name}"
    end
  end
end
