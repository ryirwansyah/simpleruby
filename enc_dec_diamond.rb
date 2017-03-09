require "base64"

def usage
  if ARGV.length < 2
    puts "tutorial: enc_dec_diamond.rb key <enc/dec> plaintext ciphertext";
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

password = "i_have_3_holes";

usage();

  data = readFile;
  if ARGV[1] == "enc"
    data = dataEncDec(data, ARGV[0]);
    data = Base64.encode64(data);
    puts "#{data}";
  elsif ARGV[1] == "dec"
    data = Base64.decode64(data);
    data = dataEncDec(data, ARGV[0]);
    puts "#{data}";
  end
	writeFile(data);
