module ApplicationHelper

  def class_active(page, default_class_item = "app-menu__item")
    return default_class_item unless current_page? page
    default_class_item + " active"
  end
end
