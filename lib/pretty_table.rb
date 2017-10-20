# frozen_string_literal: true

require 'pretty_table/version'

module PrettyTable
  def pretty_table(headers, rows, justify: :right)
    headers = headers.map(&:to_s)
    widths = headers.map(&:size)

    columns = 0..(headers.size - 1)

    rows = rows.map do |row|
      row = row.map(&:to_s)

      for i in columns
        s = row[i].size
        widths[i] = s if s > widths[i]
      end

      row
    end

    section_separator = '+-' + widths.map { |w| '-' * w }.join('-+-') + '-+'

    sign = case justify
           when :right then ''
           when :left then '-'
           else raise 'justify must be :right or :left'
           end
    row_format = '| ' + widths.map { |w| "%#{sign}#{w}s" }.join(' | ') + ' |'
    rows.map! { |r| format(row_format, *r) }

    [
      section_separator, format(row_format, *headers),
      section_separator, *rows,
      section_separator,
    ].join("\n")
  end
  module_function :pretty_table
end
