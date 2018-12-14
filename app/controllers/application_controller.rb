require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  before_action :extract_locale
  before_action :set_locale
  respond_to :html
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart
  # before_action :authenticate_user!
  include Pundit

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo, :first_name, :last_name, :address, :city, :country, :postal_code) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,
      :password_confirmation, :remember_me, :current_password, :photo, :photo_cache, :remove_photo, :first_name, :last_name, :address, :postal_code, :city) }
  end

  # Pundit: white-list approach.
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  
  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à exécuter cette action."
    redirect_to(root_path)
  end


  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
