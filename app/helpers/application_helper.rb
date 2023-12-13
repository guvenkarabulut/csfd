module ApplicationHelper
  def authenticate_user_role_is_admin!
    return if current_user.present? && (current_user.role == 'admin' || current_user.role == 'writer')

    flash[:alert] = 'You are not authorized to access this page.'
    redirect_to root_path
  end
end
