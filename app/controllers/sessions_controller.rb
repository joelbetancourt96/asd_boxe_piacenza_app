class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].to_s.strip.downcase)
    puts "eiuie"
    puts user.email
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Accesso effettuato con successo."
    else
      flash.now[:alert] = "Email o password non validi."
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Ti sei disconnesso correttamente."
  end
end
