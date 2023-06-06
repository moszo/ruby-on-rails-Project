class SessionsController < ApplicationController
  helper_method :current_user

  def new
    # Tworzenie nowego hasha dla sesji (logowania)
    @session = {}
  end

  def create
    # Pobieranie przesłanych danych z formularza logowania
    email = params[:email]
    password = params[:password]

    # Wyszukiwanie użytkownika po adresie email
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      # Logowanie powiodło się
      session[:user_id] = user.id
      redirect_to todos_url, alert: "Zostałeś zalogowany"
    else
      # Logowanie nie powiodło się
      redirect_to login_url, alert: "Logowanie nie powiodło się, spróbuj ponownie"

    end
  end

  def destroy
    # Wylogowanie użytkownika
    session[:user_id] = nil
    redirect_to root_path, alert: "Zostałeś wylogowany"
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
