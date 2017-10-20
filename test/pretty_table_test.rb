# frozen_string_literal: true

require 'test_helper'

class PrettyTableTest < Minitest::Test
  include PrettyTable

  def test_has_version_number
    refute_nil ::PrettyTable::VERSION
  end

  @@headers = ['column 1', 'column 2']
  @@rows = [
    [4_294_967_295, 'string'],
    [true, nil],
  ]

  def test_simple_table
    expected = <<~EXPECTED.chomp
      +------------+----------+
      |   column 1 | column 2 |
      +------------+----------+
      | 4294967295 |   string |
      |       true |          |
      +------------+----------+
    EXPECTED

    assert_equal expected, pretty_table(@@headers, @@rows)
  end

  def test_simple_table_left
    expected = <<~EXPECTED.chomp
      +------------+----------+
      | column 1   | column 2 |
      +------------+----------+
      | 4294967295 | string   |
      | true       |          |
      +------------+----------+
    EXPECTED

    assert_equal expected, pretty_table(@@headers, @@rows, justify: :left)
  end
end
