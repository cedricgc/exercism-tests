defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
   count_one(l)
  end

  defp count_one([_ | tail]) do
    1 + count_one(tail)
  end

  defp count_one([]) do
    0
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse_one(l, [])
  end

  defp reverse_one([head | tail], list) do
    list = [head | list]
    reverse_one(tail, list)
  end

  defp reverse_one([], list) do
    list
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map_one(l, f)
  end

  defp map_one([head | tail], f) do
    [f.(head) | map_one(tail, f)]
  end

  defp map_one([], f) do
    []
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter_one(l, f)
  end

  defp filter_one([head | tail], f) do
    result = filter_one(tail, f)
    if f.(head), do: [head | result], else: result
  end

  defp filter_one([], _) do
    []
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    reduce_one(l, acc, f)
  end

  defp reduce_one([head | tail], acc, f) do
    acc = f.(head, acc)
    reduce_one(tail, acc, f)
  end

  defp reduce_one([], acc, _) do
    acc
  end

  @spec append(list, list) :: list
  def append(a, b) do
    append_one(reverse(a), b)
  end

  defp append_one([head | tail], list) do
    list = [head | list]
    append_one(tail, list)
  end

  defp append_one([], list) do
    list
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat_one(reverse(ll), [])
  end

  defp concat_one([head | tail], list) do
    list = reduce(reverse(head), list, &([&1 | &2]))
    concat_one(tail, list)
  end

  defp concat_one([], list) do
    list
  end
end
