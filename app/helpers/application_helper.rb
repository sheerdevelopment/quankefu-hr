module ApplicationHelper
  def alert_class_for(flash_type)
    flash_type == "notice" ? :success : flash_type.to_sym
  end

  def avatar_url
    "avatar_missing.png"
  end

  def local_time(record)
    record.localtime.strftime("%Y-%m-%d %H:%M:%S")
  end
end
