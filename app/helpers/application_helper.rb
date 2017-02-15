module ApplicationHelper
  def alert_class_for(flash_type)
    flash_type == "notice" ? :success : flash_type.to_sym
  end

  def avatar_url(user: current_user, style: :medium)
    user.avatar.present? ? user.avatar.url(style) : "avatar_missing.png"
  end

  def local_time(record)
    record.localtime.strftime("%Y-%m-%d %H:%M:%S")
  end

  def active_menu_if(target_controller_name)
    "active".freeze if controller_name == target_controller_name
  end

  def selected_if(option_record, record)
    "selected".freeze if option_record == record
  end

  def current_employee
    current_user.employee
  end
end
