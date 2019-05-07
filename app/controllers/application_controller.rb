class ApplicationController < ActionController::Base


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

#Now when we try editing another user, we get redirected to the homepage and this flash error appears at the top of the page,
#appearing in the div tags we added when we installed Devise.


end
