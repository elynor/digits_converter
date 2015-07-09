require_relative 'digits_converter'
converter = DigitsConverter.new

ARGV.each do |argument|
  p converter.convert(argument.to_i)
end
