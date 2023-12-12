class CustomRegistrationsController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]

  def new
    redirect_to '/404'
  end

  def create
    # Bu metod boş bırakılabilir veya özel bir işlem ekleyebilirsiniz.
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: []) # Boş bir izin listesi
  end
end
