# app/helpers/application_helper.rb
module ApplicationHelper
    def flash_class(type)
      case type.to_sym
      when :notice then "bg-green-100 text-green-800"
      when :alert  then "bg-red-100 text-red-800"
      else "bg-blue-100 text-blue-800"
      end
    end
  
    def status_badge_class(status)
      base = "px-2 py-1 text-xs rounded-full"
      case status.to_sym
      when :new then "#{base} bg-blue-100 text-blue-800"
      when :in_progress then "#{base} bg-yellow-100 text-yellow-800"
      when :closed then "#{base} bg-green-100 text-green-800"
      else "#{base} bg-gray-100 text-gray-800"
      end
    end
  
    def priority_badge_class(priority)
      base = "px-2 py-1 text-xs rounded-full"
      case priority.to_sym
      when :low then "#{base} bg-green-100 text-green-800"
      when :medium then "#{base} bg-yellow-100 text-yellow-800"
      when :high then "#{base} bg-red-100 text-red-800"
      else "#{base} bg-gray-100 text-gray-800"
      end
    end
  end