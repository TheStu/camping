class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :check_domain

  def check_domain
    if Rails.env.production? and request.host.downcase != 'www.tenpoundbackpack.com'
      redirect_to request.protocol + 'www.tenpoundbackpack.com' + request.fullpath, :status => 301
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
