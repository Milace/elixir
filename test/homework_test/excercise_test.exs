defmodule ExcerciseTest do
  use ExUnit.Case
  alias Excercise

  @param_pascal 3
  @param_fibonacci 6
  @param_ejer1 5

  test "pascal1/1" do
    assert Excercise.pascal1(@param_pascal) == [1, 2, 1]
  end

  test "pascal2/1" do
    assert Excercise.pascal2(@param_pascal) == [1, 2, 1]
  end

  test "fibonacci/1" do
    assert Excercise.fibonacci(@param_fibonacci) == 8
  end

  test "ejer1/1" do
    assert Excercise.ejer1(@param_ejer1) == 15
  end

  test "ejer2/1" do
    assert Excercise.ejer2(@param_ejer1) == [1, 2, 3, 4, 5]
  end

  test "ejer21/1" do
    assert Excercise.ejer21(@param_ejer1) == 5
  end

  test "ejer3/2" do
    a = 2
    b = 5
    assert Excercise.ejer3(a , b) == 10
  end

  test "ejer4/2" do
    a = 2
    b = 5
    assert Excercise.ejer4(a , b) == 1
  end

  test "fib_optimized/1" do
    assert Excercise.fib_optimized(@param_fibonacci) == 8
  end

  test "sum/1" do
    list = [1,2,3]
    assert Excercise.sum(list) == 6
  end

  test "reverse/1" do
    list = [1,2,3]
    assert Excercise.reverse(list) == [3,2,1]
  end

  test "ascendant?/1" do
    list = [1,2,3]
    assert Excercise.ascendant?(list) == true
  end

  test "unir/2" do
    p = "abcde"
    q = "pqrst"
    assert Excercise.unir(p, q) == "apbqcrdset"
  end

  test "cont/1" do
    p = "aaabaaaaccaaaaba"
    assert Excercise.cont(p) == "a3ba4c2a4ba1"
  end

  test "change_data/1" do
    string = "abcdpqrs"
    assert Excercise.change_data(string) == "badcqpsr"
  end

  test "sum_numbers/1" do
    n = 975
    assert Excercise.sum_numbers(n) == 3
  end

  test "search_numbers1/2" do
    lista1 = [1,3,5,6,7,9]
    lista2 = [1,2,3,4,5,6,7,8,9]
    assert Excercise.search_numbers1(lista1, lista2) == [2,4,8]
    assert Excercise.search_numbers2(lista1, lista2) == [2,4,8]
  end

  test "sort_by_letters/1" do
    string = "aababc"
    assert Excercise.sort_by_letters(string) == "aaabbc"
    assert Excercise.sort_by_letters2_c(string) == "aaabbc"
    assert Excercise.sort_by_letters3(string) == "aaabbc"
  end
end
