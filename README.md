# simpleruby

usage = ruby enc_dec_diamond.rb password enc/dec plain.txt encrypted.txt

simple to use

ur password, will be a xor key of this file

syntax

require "base64"

def usage
  if ARGV.length < 2
    puts "usage : enc_dec_diamond.rb key enc/dec plain.txt cipher.txt";
    exit;
  end
end

def readFile
  content = File.read(ARGV[2]);
  return content;
end

def writeFile(data)
  File.open(ARGV[3], 'w') { |file|
    file.write(data);
  }
end

def dataEncDec(data, key)
  data.length.times { |e|

    keychar = key[e % key.length].ord;
    inchar = data[e].ord;
    data[e] = (keychar ^ inchar).chr;
  }
  return data;
end

usage();

  data = readFile;
  if ARGV[1] == "enc" #encrypting file
    data = dataEncDec(data, ARGV[0]);
    data = Base64.encode64(data);
    puts "#{data}";
  elsif ARGV[1] == "dec" #decrypting file
    data = Base64.decode64(data);
    data = dataEncDec(data, ARGV[0]);
    puts "#{data}";
  end
    writeFile(data);


