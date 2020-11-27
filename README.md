# Introspection

Introspection for the Crystal language, without macros.

Currently this shard only provides an `Object#instance_methods` method.
This works on instances, classes, and modules. It returns the data
structure below.

For a discussion of *internal* and *external* argument names,
please see [this section of the Crystal documentation](https://crystal-lang.org/reference/syntax_and_semantics/default_values_named_arguments_splats_tuples_and_overloading.html#external-names).
```crystal
[   # This is an array of named tuples defining methods.
  {
    visibility : String, # "public", "private", "protected".
    name : String, # Name of the method.
    double_splat : String # Name of the double-splat argument, if present.
    splat_index : Int32 # Argument number of the double-splat argument.
    return_type : String # The return type of the method.
    arguments : [ # Array of arguments to the method.
      {
        name : String # The argument's external name.
        internal_name : String # The argument's internal name.
        type : String # The type restriction of the argument.
        default_value : String # The default value, if no argument is provided.
      },
    ]
    block_arguments : [
        String, ... # The types of the block arguments.
    ],
    block_return : String # The return type of the block.
    body : String # The text of the method body.
  },
]
```

## Usage

`require "introspection"`

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     introspection:
       github: BrucePerens/introspection
   ```

2. Run `shards install`

## Usage

This program gets an array of information about the instance methods
of `Object`. It selects the information for the "pretty_inspect" method,
and then renders the information using the pretty_inspect method.
```crystal
require "introspection"

p Object.instance_methods.find { |method| method[:name] == "pretty_inspect" }.pretty_inspect
```
It should print something like:
```
{visibility: ":public",
 name: "pretty_inspect",
 double_splat: "",
 splat_index: 0,
 return_type: "String",
 arguments: 
  [{name: "width", internal_name: "width", type: "", default_value: "79"},
   {name: "newline",
    internal_name: "newline",
    type: "",
    default_value: "\"\\n\""},
   {name: "indent", internal_name: "indent", type: "", default_value: "0"}],
 block_argument: [],
 block_return: "",
 body: 
  "String.build do |io|\n" +
  "  PrettyPrint.format(self, io, width, newline, indent)\n" +
  "end"}
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/introspection/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Bruce Perens](<bruce@perens.com>, @BrucePerens, <https://github.com/BrucePerens>) - creator and maintainer.

MIT license. Copyright (C) 2000 Algorithmic LLC.
