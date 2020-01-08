FactoryBot.define do
  factory(:payment) do
    user { association(:user) }
    total { '%.2f' % rand(1.0..1000) }
    success { [true, false].sample }
  end
end
