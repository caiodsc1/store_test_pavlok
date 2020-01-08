class PaymentsNotificationMailer < ApplicationMailer
  def notify_user(user, total = 0, success = false)
    if success
      mail from: 'no-reply@shoppingcart.com.br',
           to: user.email,
           subject: 'Confirmação de pagamento',
           body: "Compra de $ #{total} efetuada com sucesso em Shopping Cart."
    else
      mail from: 'no-reply@shoppingcart.com.br',
           to: user.email,
           subject: 'Confirmação de pagamento',
           body: "Falha ao realizar compra em Shopping Cart."
    end
  end

  def notify_admin(user, total = 0, success = false)
    if success
      mail from: 'no-reply@shoppingcart.com.br',
           to: ENV['ADMIN_EMAIL'],
           subject: 'Confirmação de pagamento',
           body: "Cliente #{user.email} efetuou uma compra de $ #{total}."
    else
      mail from: 'no-reply@shoppingcart.com.br',
           to: ENV['ADMIN_EMAIL'],
           subject: 'Confirmação de pagamento',
           body: "Cliente #{user.email} não conseguiu efetuar uma compra."
    end
  end
end
