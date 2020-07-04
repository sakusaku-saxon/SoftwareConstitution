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
    when /\A(\d+)/
      #digits
      yield $&, :number
    when /\A([_a-zA-Z]\w+)/
      #identifier
      token = $keywords[$&]
      if token
        yield $&, token
      else
        yield $&, :identifier
      end
    when /\A(\S)/
      #other
    end
    $line = $'
end

lineno = 0

#メイン
while $line = gets
  lineno += 1
  until $line.empty? do
    lex() do |l, t|
      if t == :identifier
        puts lineno.to_s + " : " + l
      end
    end
  end
end
