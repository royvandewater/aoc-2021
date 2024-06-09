defmodule Day8Test do
  use ExUnit.Case

  describe "parse!" do
    test "foo | bar" do
      input = "
      foo | bar
      "
      assert Day8.parse!(input) == [{["foo"], ["bar"]}]
    end
  end

  describe "parse_line!" do
    test "foo | bar" do
      {signal_patterns, output} = Day8.parse_line!("foo | bar")
      assert signal_patterns == ["foo"]
      assert output == ["bar"]
    end
  end

  describe "part_1" do
    test "example 1" do
      input = "
        be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
        edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
        fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
        fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
        aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
        fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
        dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
        bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
        egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
        gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
      " |> Day8.parse!()

      assert Day8.part_1(input) == 26
    end

    test "with an empty list" do
      assert Day8.part_1([]) == 0
    end

    test "with a single item containing a 2 digit value" do
      assert Day8.part_1([{[], ["ab"]}]) == 1
    end

    test "with a single item containing a 3 digit value" do
      assert Day8.part_1([{[], ["abc"]}]) == 1
    end

    test "with a single item containing a 4 digit value" do
      assert Day8.part_1([{[], ["abcd"]}]) == 1
    end

    test "with a single item containing a 7 digit value" do
      assert Day8.part_1([{[], ["abcdefg"]}]) == 1
    end

    test "with a single item containing a 5 digit value" do
      assert Day8.part_1([{[], ["abcde"]}]) == 0
    end
  end

  describe "part_2" do
    test "example 1" do
      input = "
        be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
        edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
        fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
        fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
        aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
        fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
        dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
        bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
        egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
        gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
      " |> Day8.parse!()

      assert Day8.part_2(input) == 61229
    end
  end

  describe "decode" do
    test "example 1" do
      input =
        "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
        |> Day8.parse_line!()

      assert Day8.decode(input) == 5353
    end

    test "example 2, line 1" do
      input =
        "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe"
        |> Day8.parse_line!()

      assert Day8.decode(input) == 8394
    end

    test "example 2, line 2" do
      input =
        "edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc"
        |> Day8.parse_line!()

      assert Day8.decode(input) == 9781
    end

    test "example 2, line 3" do
      input =
        "fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg"
        |> Day8.parse_line!()

      assert Day8.decode(input) == 1197
    end

    test "example 2, line 4" do
      input =
        "fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb"
        |> Day8.parse_line!()

      assert Day8.decode(input) == 9361
    end
  end

  describe "generate_lookup" do
    test "example 1" do
      {signal, _} =
        "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
        |> Day8.parse_line!()

      result = Day8.generate_lookup(signal)

      assert result["ab"] == 1
      assert result["abef"] == 4
      assert result["abd"] == 7
      assert result["abcdefg"] == 8
      assert result["abcdef"] == 9
      assert result["bcdefg"] == 6
      assert result["abcdf"] == 3
      assert result["bcdef"] == 5
      assert result["acdfg"] == 2
      assert result["abcdeg"] == 0

      assert Day8.generate_lookup(signal) == %{
               "abcdeg" => 0,
               "ab" => 1,
               "acdfg" => 2,
               "abcdf" => 3,
               "abef" => 4,
               "bcdef" => 5,
               "bcdefg" => 6,
               "abd" => 7,
               "abcdefg" => 8,
               "abcdef" => 9
             }
    end
  end

  describe "is_1" do
    test "given a 2 digit value" do
      assert Day8.is_1?("ab")
    end
  end

  describe "transpose" do
    test "with an empty object" do
      assert Day8.transpose(%{}) == %{}
    end

    test "with a single item" do
      assert Day8.transpose(%{a: 1}) == %{1 => :a}
    end
  end
end
