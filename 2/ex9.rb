#予約語をハッシュに登録
$keywords = {
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

$line = ""

#C言語の字句解析をするメソッド
def lex()
    case $line
    when /\A\s+/
      #spaces
      puts "spaces"
    when /\A(\d+)/
      #digits
      puts "number(#{$1})"
    when /\A([_a-zA-Z]\w+)/
      #identifier
      token = $keywords[$&]
      if token
        puts "keyword(#{token})"
      else
      puts "identifier(#{$1})"
      end
    when /\A(\S)/
      #other
      puts "other(#{$1})"
    end
    $line = $'
end

#メイン
while $line = gets
  until $line.empty? do
    lex()
  end
end
