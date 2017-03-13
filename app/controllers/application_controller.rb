class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # require login or signup to continue
  before_action :authenticate_user!
end
