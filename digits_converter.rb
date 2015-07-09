class DigitsConverter
  def initialize
    @ones = %w(
      zero one two three four five six seven eight nine ten
      eleven twelve thirteen fourteen fifteen
      sixteen seventeen eighteen nineteen
    )
    @tens = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
    # Empty string at @tens[0] for empty tens situation
    @tens.unshift('')
    @hundred = 'hundred'
    @lots = %w(thousand million billion)
    @lots.unshift('')
  end

  def convert(number)
    unless number.is_a?(Numeric)
      fail ArgumentError.new('Use only the numbers please!')
    end
    transform(number)
  end

  private

  def transform(number)
    result = ''
    lots_index = 0
    num_array = number.to_s.split('').map(&:to_i)
    return transform_chunk(num_array) if num_array.length < 4
    num_array.reverse.each_slice(3) do |chunk|
      transform_result = transform_chunk(chunk.reverse)
      chunk_result = form_result(transform_result, @lots[lots_index])
      result = form_result(chunk_result, result) unless transform_result.empty?
      lots_index += 1
    end
    result
  end

  def transform_chunk(num_array)
    case num_array.length
    when 1
      single(num_array[0], true)
    when 2
      return single(num_array.join.to_i, true) if num_array[0] <= 1
      tens(num_array)
    when 3
      hundreds(num_array)
    else
      ''
    end
  end

  def single(number, whole = false)
    return '' if number == 0 && !whole
    @ones[number]
  end

  def tens(num_array)
    form_result(@tens[num_array.first], single(num_array.last))
  end

  def hundreds(num_array)
    hundred = (num_array[0] == 0) ? '' : @hundred
    form_result(single(num_array[0]), hundred, tens(num_array[1..-1]))
  end

  def form_result(*data)
    data.join(' ').strip
  end
end
