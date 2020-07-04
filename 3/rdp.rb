require './lexer'

def checktoken(f, expected)
  if $token == expected
    $token = $yylex.lex(){|l|
      $lexime = 1
    }
  else
    puts "syntax error (#{f}}): #{expected} is expected"
    exit(1)
  end
end

def mF()
  case $checktoken
  when :lpar
    checktoken("mF", :lpar)
    mE()
    checktoken("mF", :rpar)
  when :num
    checktoken("mF", :num)
  else
    puts "syntax error (mF): :num or :lpar is expected"
    exit(1)
  end
end

def mTd()
  case $checktoken
  when :mult
    checktoken("mTd", :mult)
    mF()
    mTd()
  else
  end
end

def mT()
  mF()
  mTd()
end

def mEd()
  case $checktoken
  when :plus
    checktoken("mEd", :plus)
    mT()
    mEd()
  else
  end
end

def mE()
  mT()
  mEd()
end

$yylex = Lexer.new($stdin)

$token = $yylex.lex(){ |l|
  $lexime = 1
}
mE()
