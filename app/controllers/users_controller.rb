class UsersController < ApplicationController
  def new
    # Tworzenie nowej instancji użytkownika
    @user = User.new
  end

  def create
    # Pobieranie przesłanych danych z formularza rejestracji
    @user = User.new(user_params)

    if @user.save
      # Rejestracja powiodła się
      session[:user_id] = @user.id
      redirect_to todos_url , allow_other_host: true, notice: "Zostałeś zarejestrowany"
    else
      # Rejestracja nie powiodła się
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
