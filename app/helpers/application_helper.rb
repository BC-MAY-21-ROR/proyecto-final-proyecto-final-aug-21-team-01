module ApplicationHelper
  def show_login_link(resource_name)
    content = ''
    if controller_name != 'sessions'
      content << "<p class='form__label'>Already have an account? #{link_to "Log in", new_session_path(resource_name), class:'form__link'}</p> <br />"
    end
    content.html_safe
  end

  def show_register_link(resource_name)
    content = ''
    if devise_mapping.registerable? && controller_name != 'registrations'
      content << "<p class='form__label'>Do not have an account? #{link_to "Register", new_registration_path(resource_name), class:'form__link'}</p> <br />"
    end
    content.html_safe
  end

  def show_forgot_link(resource_name)
    content = ''
    if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
      content << "#{link_to "Forgot your password?", new_password_path(resource_name), class:'form__link'} <br />"
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

  def render_svg(name, styles:"fill-current text-red-400 icon-sm", title:nil)
    filename = "#{name}.svg"
    title ||= name.underscore.humanize
    inline_svg_tag("icons/#{filename}", aria: true, nocomment:true, title: title, class: styles)
  end

  def class_private(css = false)
    css ? "public" : "private"
  end

  def render_plan_description(current_user)
    if current_user.premium?
      '<p>You can create unlimited groups for sharing costs and bills</p>'.html_safe
    else
      '<p>You can create 4 groups for sharing cost and groupal bills</p>'.html_safe
    end
  end

  def create_group_button(current_user)
    content = ''
    if current_user.can_create_groups?
      link_to 'CREATE GROUP', new_group_path, class:'btn btn-dark'
    else
      content << '<p>You can create only a maximum of 4 groups,if you want to create more groups you need to upgrade your account to premium</p>'
      content << "#{link_to 'UPGRADE PLAN', upgrade_path, method: :post, remote: true, class: 'btn btn-dark'} <br />"
      content.html_safe
    end
  end

  def create_participants_button(form, current_user)
    content = ''
    if current_user.can_create_participants?
      link_to_add_association form, :participating_users, class: 'btn btn-dark' do
        'Add Participant'
      end
    else
      content << '<p>You can create only a maximum of 4 participants,if you want to create more groups you need to upgrade your account to premium</p>'
      content << "#{link_to 'UPGRADE PLAN', '#', class: 'btn btn-dark'} <br />"
      content.html_safe
    end
    
  end
end
