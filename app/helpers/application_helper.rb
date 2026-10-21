# frozen_string_literal: true

module ApplicationHelper
  def flash_classes(type)
    case type.to_sym
    when :notice, :success
      'border-green-200 bg-green-50 text-green-800'
    when :alert, :error
      'border-red-200 bg-red-50 text-red-800'
    when :warning
      'border-yellow-200 bg-yellow-50 text-yellow-800'
    else
      'border-gray-200 bg-gray-50 text-gray-800'
    end
  end
end
