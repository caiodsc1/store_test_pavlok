class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def after_sign_in_path_for(resource)
    wish_list_edit_path
  end

  private

  def record_not_found
    redirect_to '/'
  end
end
