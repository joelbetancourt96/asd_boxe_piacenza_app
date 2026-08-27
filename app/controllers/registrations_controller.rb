class RegistrationsController < ApplicationController
  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(registration_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Registrazione completata con successo."
    else
      @user.build_profile if @user.profile.nil?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      profile_attributes: [ :first_name, :last_name, :profile_type ]
    )
  end
end
