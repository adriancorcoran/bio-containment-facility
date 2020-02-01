# frozen_string_literal: true
# contain resistance functions
module Formatting
  def line_full
    "-" * 40 + "\n"
  end

  def line_short
    "    " + ("-" * 10) + "\n"
  end

  def heading(text)
    "\n" + line_full + text + "\n" + line_full
  end

  def symbol_list_to_string(symbol_array)
    symbol_array.map { |symbol| symbol.to_s.gsub(/_/, " ").sub(/^./, &:upcase) }.join(", ")
  end

  def plural(string, number, es = false)
    symbol = es ? 'es' : 's'
    "#{string}#{number == 1 ? '' : symbol}"
  end

  def currencyise(number, symbol = "$")
    "#{symbol}#{number.to_s.reverse.scan(/\d{3}|.+/).join(',').reverse}"
  end
end
