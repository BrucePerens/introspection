require "./introspection"

m = Object.instance_methods.find { |method| method[:name] == "pretty_inspect" }
puts m.pretty_inspect
