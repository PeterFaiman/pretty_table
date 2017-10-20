# PrettyTable

[![Build Status](https://travis-ci.org/PeterFaiman/pretty_table.svg?branch=master)](https://travis-ci.org/PeterFaiman/pretty_table)

Format arrays into ASCII tables.

Includes a command line tool `pretty_table` that reads text input and
outputs a pretty table.

## Gem Usage

```ruby
require 'pretty_table'

headers = ['column 1', 'column 2']
rows = [
  [4_294_967_295, 'string'],
  [true, nil],
]

puts PrettyTable.pretty_table(headers, rows)
puts PrettyTable.pretty_table(headers, rows, justify: :left)
```

Output:

```text
+------------+----------+
|   column 1 | column 2 |
+------------+----------+
| 4294967295 |   string |
|       true |          |
+------------+----------+
+------------+----------+
| column 1   | column 2 |
+------------+----------+
| 4294967295 | string   |
| true       |          |
+------------+----------+
```

## Tool Usage

The command line tool accepts a field separator. It recognizes a single
\\t as tab, and a single \\xHH as a hex specified character.

```text
$ pretty_table -F ,
column 1,column 2
4_294_967_295,string
true,nil
^D
+---------------+----------+
|      column 1 | column 2 |
+---------------+----------+
| 4_294_967_295 |   string |
|          true |      nil |
+---------------+----------+

```

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
