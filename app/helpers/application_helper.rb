module ApplicationHelper
  def show_login_link(resource_name)
    content = ''
    if controller_name != 'sessions'
      content << "#{link_to "Log in", new_session_path(resource_name)} <br />"
    end
    content.html_safe
  end

  def show_register_link(resource_name)
    content = ''
    if devise_mapping.registerable? && controller_name != 'registrations'
      content << "#{link_to "Register", new_registration_path(resource_name)} <br />"
    end
    content.html_safe
  end

  def show_forgot_link(resource_name)
    content = ''
    if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
      content << "#{link_to "Forgot your password?", new_password_path(resource_name)} <br />"
    end
    content.html_safe
  end

  def show_without_confirmation_link(resource_name)
    content = ''
    if devise_mapping.confirmable? && controller_name != 'confirmations'
      content << "#{link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name)} <br />"
    end
    content.html_safe
  end

  def show_without_unlock_instructions_link(resource_name)
    content = ''
    if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
      content << "#{link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name)} <br />"
    end
    content.html_safe
  end

end
