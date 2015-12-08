defmodule Phone do
  @invalid_number "0000000000"
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    clean = String.replace(raw, ~r/[\D]/, "")
    number_length = String.length(clean)
    cond do
      number_length == 11 and String.starts_with?(clean, "1") ->
        String.slice(clean, 1, String.length(clean))
      number_length != 10 ->
        @invalid_number
      String.match?(raw, ~r/[a-zA-Z]+/u) ->
        @invalid_number
      true ->
        clean
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    phone_number = number(raw)
    String.slice(phone_number, 0, 3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    phone_number = number(raw)
    {area_code, rest} = String.split_at(phone_number, 3)
    {exchange, subscriber} = String.split_at(rest, 3)
    "(#{area_code}) #{exchange}-#{subscriber}" 
  end
end
