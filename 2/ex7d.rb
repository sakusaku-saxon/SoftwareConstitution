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
      #spaces
      puts "spaces"
    when /\A(\d+)/
      #digits
      puts "digits(#{$1})"
    when /\A([_a-zA-Z]\w+)/
      #identifier
      if keywords.find{|k,v| k =="#{$1}"}
        puts "keyword(#{$1})"
      else
        puts "identifier(#{$1})"
      end
    when /\A(\S)/
      puts "other(#{$1})"
    end
    line = $'
  end
end
