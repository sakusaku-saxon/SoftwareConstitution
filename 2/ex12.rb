class Lexer

  def initialize(f)
    @srcf = f
    @lineno = 0
    @line = ""
    @keywords = {
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
  end

  attr_reader :lineno

  #C言語の字句解析をするメソッド
  def lex()
    if @line.empty? then
      @line  = @srcf.gets
      @lineno += 1
      if @line == nil
        return false
      end
    end

    case @line
    when /\A\s+/
      #spaces
      #nothing to do
    when /\A(\d+)/
      #digits
      #yield $&, :number
    when /\A([_a-zA-Z]\w+)/
      #identifier
      token = @keywords[$&]
      if token
        #yield $&, token
      else
        yield $&, :identifier
      end
    when /\A(\S)/
      #other
    end
    @line = $'
    true
  end
end



#Lexerクラスのインスタンスを使う
lexer = Lexer.new($stdin)
cr = {}

while lexer.lex() { |l, t|
  if t == :identifier
    if cr[l]
      cr[l].push(lexer.lineno)
    else
      cr[l] = [lexer.lineno]
    end
  end
}
end

cr.sort.each do |k, v|
  print "#{k} : "
  puts v.join(", ")
end
