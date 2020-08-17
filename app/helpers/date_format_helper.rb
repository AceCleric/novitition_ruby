# frozen_string_literal: true

module DateFormatHelper
  def format_to_date(date)
    date&.strftime('%d-%m-%Y')
  end
end
