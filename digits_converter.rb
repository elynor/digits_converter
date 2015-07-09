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
  end

  def convert(number)
    transform_chunk(number)
  end

  private

  def transform
  end

  def transform_chunk(number)
    return single(number, true) if number < 20
    num_array = number.to_s.split('').map(&:to_i)
    if num_array.length == 2
      tens(num_array)
    else
      form_result(single(num_array[0]), @hundred, tens(num_array[1..-1]))
    end
  end

  def single(number, whole = false)
    return '' if number == 0 && !whole
    @ones[number]
  end

  def tens(num_array)
    form_result(@tens[num_array.first], single(num_array.last))
  end

  def form_result(*data)
    data.join(' ').rstrip
  end
end
