module ApplicationHelper
  def alert_class_for(flash_type)
    flash_type == "notice" ? :success : flash_type.to_sym
  end

  def ending_path(ending)
    method_name = "#{ending.class.to_s.downcase}_path".to_sym
    public_send(method_name, ending)
  end

  def avatar_url
    "avatar_missing.png"
  end
end
