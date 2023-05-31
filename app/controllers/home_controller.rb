class HomeController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = 'Musisz być zalogowany, aby zobaczyć tę stronę.'
      redirect_to login_path
    end
  end
end
