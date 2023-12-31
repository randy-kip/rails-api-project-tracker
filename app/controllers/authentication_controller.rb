class AuthenticationController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :authenticate
    skip_before_action :authorize_request, only: :authenticate, raise: false

    # /signin
    def authenticate
        auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
        json_response(auth_token: auth_token)
    end

    private

    def auth_params
        params.permit(:email, :password)
    end
end
