class HomesController < ApplicationController
  def top

  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to users_mypage_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
