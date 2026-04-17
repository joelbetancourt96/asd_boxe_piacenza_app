class ContactMailer < ApplicationMailer
  default from: "info@boxepiacenza.it"

  def submission_email(contact_params)
    @name = contact_params[:first_name]
    @lastname = contact_params[:last_name]
    @email = contact_params[:email]
    @message = contact_params[:message]
    @to = "r.joelbetancourt96@gmail.com"

    mail(
      to: @to,
      subject: "Nuovo messaggio di contatto da #{@name} #{@lastname}"
    )
  end
end
