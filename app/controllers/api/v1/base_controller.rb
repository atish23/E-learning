class Api::V1::BaseController < ActionController::API
  include AuthenticationHelper
  # skip_before_action :verify_authenticity_token

  before_action :authenticate_request!


end
