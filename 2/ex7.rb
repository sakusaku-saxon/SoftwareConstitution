keywords = {
  "auto" => :auto,
  "break" => :break,
  "case" => :case,
  "char" => :char,
  "const" => :const,
  "continue" => :continue,
  "default" => :default,
  "do" => :do,
  "double" => :double,
  "else" => :else,
  "enum" => :enum,
  "extern" => :extern,
  "float" => :float,
  "for" => :for,
  "goto" => :goto,
  "if" => :if,
  "int" => :int,
  "long" => :long,
  "register" => :register,
  "return" => :return,
  "short" => :short,
  "signed" => :signed,
  "sizeof" => :sizeof,
  "static" => :static,
  "struct" => :struct,
  "switch" => :switch,
  "typedef" => :typedef,
  "union" => :union,
  "unsigned" => :unsigned,
  "void" => :void,
  "volatile" => :volatile,
  "while" => :while
}

while line = gets
  until line.empty? do
    case line
    when /\A\s+/
      # spaces
      print "spaces"
    when /\A(\d+)/
      #digits
      print "number (#{$1})"
    when /\A([_a-zA-Z]\w*)/
      #identifier
      token = keywords[$&]
      if token
        print "keyword(#{token})"
      else
        print "identifier(#{$1})"
      end
    when /\A(\S)/
      print "other : #{$1}"
    end
    line = $'
  end
end
