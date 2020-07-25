class UserIsAdmin
  def self.matches?(request)
    request.session[:user_id].present? && User.find(request.session[:user_id]).admin?
  end
end
