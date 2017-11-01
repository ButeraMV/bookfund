class PermissionsService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    return true if controller == 'welcome' && action.in?(%w(show))

    if user.registered_user?
      return true if controller == 'users' && action.in(%w(show))
    end
  end
end