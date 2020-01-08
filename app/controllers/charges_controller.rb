require './app/services/stripe_charges_service.rb'

class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  end

  def create
    success = StripeChargesServices.new(charges_params, current_user).call
    Payment.create(user: current_user,
                 total: current_user.wish_list.products_total,
                 success: success)

    current_user.clear_cart

    PaymentsNotificationMailer.notify_user(user, total, success).deliver_later
    PaymentsNotificationMailer.notify_admin(user, total, success).deliver_later

    redirect_to wish_list_edit_path
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
