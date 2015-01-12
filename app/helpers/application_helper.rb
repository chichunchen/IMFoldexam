module ApplicationHelper
  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe
  end 

  # simplify upload file name
  def simple_name(name)
    result = name.to_s[27..-1]
    location = result.index('/')
    truncate(result[location + 1..-1], length: 20)
  end

  def render_chinese_version
    link_to "中文版", :controller => controller.controller_name,
             :action => controller.action_name, :locale => "zh-TW"
  end

  def render_engilsh_version
    link_to "English", :controller => controller.controller_name,
             :action => controller.action_name, :locale => "en"
  end
end
