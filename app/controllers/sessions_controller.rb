class SessionsController < Devise::SessionsController
  def create
    super
    flash[:success] = "Hey, #{current_user.first_name}"
  end
end
