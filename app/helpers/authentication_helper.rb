require 'json_web_token'
module AuthenticationHelper

  def logged_in?
    current_user.present?
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end

  def require_school_admin
    unless logged_in? && (current_user.admin? || current_user.schooladmin?)
      flash[:error] = "You must be a school admin to access this section"
      redirect_to root_path
    end
  end

  def current_user_can?(permission_name)
    current_user&.role&.permission?(permission_name)
  end

  def require_permission(permission_name)
    unless current_user_can?(permission_name)
      flash[:error] = "You do not have permission to perform this action"
      redirect_to root_path
    end
  end

  def authenticate_request!
    unless user_id_in_token?
      render json: { error: 'Not Authorized' }, status: :unauthorized
      return
    end
    byebug
    @current_user = User.find(auth_token["user_id"])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= ::JsonWebToken.decode(request.headers['Authorization'].split(' ').last)
  end

  def user_id_in_token?
    request.headers['Authorization'].present? && auth_token && auth_token[:user_id].to_i
  end
end
