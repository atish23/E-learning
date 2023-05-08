require 'json_web_token'  

class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    render json: { 
      user: UserSerializer.new(resource),
      token: JsonWebToken.encode(user_id: resource.id)
    }
  end

  def destroy
    (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?
    render json: {}
  end
end
