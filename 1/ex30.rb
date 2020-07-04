print "Input lines: "

while line = gets
  until line.empty? do
    case line
    when /\A\s+/
    when /\Aauto/
      puts "reserved word(auto)"
    when /\Abreak/
      puts "reserved word (break)"
    when /\Acase/
      puts "reserved word (case)"
    when /\Achar/
      puts "reserved word (char)"
    when /\Aconst/
      puts "reserved word (const)"
    when /\Acontinue/
      puts "reserved word (continue)"
    when /\Adefault/
      puts "reserved word (default)"
    when /\Ado/
      puts "reserved word (do)"
    when /\Adouble/
      puts "reserved word (double)"
    when /\Aelse/
      puts "reserved word (else)"
    when /\Aenum/
      puts "reserved word (enum)"
    when /\Aextern/
      puts "reserved word (extern)"
    when /\Afloat/
      puts "reserved word (float)"
    when /\Afor/
      puts "reserved word (for)"
    when /\Agoto/
      puts "reserved word (goto)"
    when /\Aif/
      puts "reserved word (if)"
    when /\Aint/
      puts "reserved word (int)"
    when /\Along/
      puts "reserved word (long)"
    when /\Aregister/
      puts "reserved word (register)"
    when /\Areturn/
      puts "reserved word (return)"
    when /\Ashort/
      puts "reserved word (short)"
    when /\Asigned/
      puts "reserved word (signed)"
    when /\Asizeof/
      puts "reserved word (sizeof)"
    when /\Astatic/
      puts "reserved word (static)"
    when /\Astruct/
      puts "reserved word (struct)"
    when /\Aswitch/
      puts "reserved word (switch)"
    when /\Atypedef/
      puts "reserved word (typedef)"
    when /\Aunion/
      puts "reserved word (union)"
    when /\Aunsigned/
      puts "reserved word (unsigned)"
    when /\Avoid/
      puts "reserved word (void)"
    when /\Avolatile/
      puts "reserved word (volatile)"
    when /\Awhile/
      puts "reserved word (while)"
    when /\A(\S+)/
      puts "word(#{$1})"
    end
    line = $'
  end
end
