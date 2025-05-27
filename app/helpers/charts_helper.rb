# app/helpers/charts_helper.rb
module ChartsHelper
    def status_color(status)
      case status.downcase.to_sym
      when :new then '#3B82F6' # blue
      when :in_progress then '#F59E0B' # yellow
      when :closed then '#10B981' # green
      else '#8B5CF6' # purple
      end
    end
  end