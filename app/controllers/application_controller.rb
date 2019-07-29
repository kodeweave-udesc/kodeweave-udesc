require 'google/apis/people_v1'
require 'google/api_client/client_secrets.rb'

class ApplicationController < ActionController::Base
  include Pundit

  People = Google::Apis::PeopleV1

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception
  before_action :configure_devise_params, if: :devise_controller?

  before_action :authenticate_user!

  layout -> { devise_controller? && !user_signed_in? ? 'devise' : 'application' }

  def contacts
    secrets = Google::APIClient::ClientSecrets.new(
      {
        "web" =>
          {
            "access_token" => current_user.token,
            "refresh_token" => current_user.refresh_token,
            "client_id" => ENV['GOOGLE_CLIENT_ID'],
            "client_secret" => ENV['GOOGLE_CLIENT_SECRET']
          }
      }
    )

    service = People::PeopleServiceService.new
    service.authorization = secrets.to_authorization
    response = service.list_person_connections(
      'people/me',
      person_fields: ['names', 'emailAddresses']
    )
    render json: response
  end

  private

  def user_not_authorized(_exception)
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referer || root_path)
  end

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf])
  end
end
