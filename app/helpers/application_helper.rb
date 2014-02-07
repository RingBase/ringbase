module ApplicationHelper
  def flash_error
    if msg = flash[:error]
      content_tag(:div, msg, class: "alert alert-danger")
    end
  end

  def flash_success
    if msg = flash[:success]
      content_tag(:div, msg, class: "alert alert-success")
    end
  end
end
