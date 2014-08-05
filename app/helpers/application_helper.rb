module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "LingoAmigo").join(" - ")
      end
		end
  end

  def bootstrap_class_for flash_type
    if flash_type.to_s == "success"
      return "alert-success"
    elsif flash_type.to_s == "error"
      return "alert-danger"
    elsif flash_type.to_s == "alert"
      return "alert-warning"
    elsif flash_type.to_s == "notice"
      return "alert-info"
    else
      return flash_type.to_s
    end
  end
end