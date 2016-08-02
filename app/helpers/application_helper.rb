module ApplicationHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
      class="close" data-dismiss="alert">×</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def current_user?(user)
    current_user.id == user.id
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end

  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-success"
    when :info then "alert alert-info"
    when :alert then "alert alert-danger"
    when :warning then "alert alert-warning"
    end
  end
end
