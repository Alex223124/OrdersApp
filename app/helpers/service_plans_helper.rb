module ServicePlansHelper
  # Returns a dynamic path based on the provided parameters
  def sti_service_plan_path(type = "service_plan", service_plan = nil, action = nil)
    send "#{format_sti(action, type, service_plan)}_path", service_plan
  end

  def format_sti(action, type, service_plan)
    action || service_plan ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end

end
