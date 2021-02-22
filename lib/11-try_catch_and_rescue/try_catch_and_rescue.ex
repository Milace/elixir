defmodule TryCatchAndRescue do
  defexception message: "error de try catch and rescue"

  def error1() do
    try do
      raise "esto es una excepcion de RuntimeError"
    rescue
      e in RuntimeError -> e
    end
  end

  def error2() do
    try do
      raise TryCatchAndRescue, message: "esto es una excepcion"
    rescue
      e in TryCatchAndRescue -> e
    end
  end

  def error3() do
    try do
      Enum.each(-50..50, fn(x) ->
        if rem(x, 13) == 0, do: throw(x)
      end)
    rescue
      x -> "tiene #{x}"
    end
  end

  def error4() do
    try do
      exit "voy a salir"
    catch
      :exit, _ -> "no vas a salir"
    end
  end

  def error5(x) do
    try do
      1 / x
    rescue
      ArithmeticError -> :infinity
    else
      y when y < 1 and y > -1 ->
        :smal

      _  ->
          :largue
    end
  end
end
