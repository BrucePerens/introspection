require "./introspection"

puts  Object.instance_methods.find { |method| method[:name] == "pretty_inspect" }.pretty_inspect
