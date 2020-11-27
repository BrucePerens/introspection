require "./introspection"

p Object.instance_methods.find { |method| method[:name] == "pretty_inspect" }
