class ContactsController < ApplicationController
  def index
  end

  def create
    @contact_params = contact_params
    ContactMailer.submission_email(@contact_params).deliver_now
    redirect_to contactus_path, notice: "Messaggio inviato con successo! Ti contatteremo presto."
  rescue StandardError => e
    redirect_to contactus_path, alert: "Errore nell'invio del messaggio. Riprova più tardi."
  end

  private

  def contact_params
    params.permit(:first_name, :last_name, :email, :message, :privacy)
  end
end
