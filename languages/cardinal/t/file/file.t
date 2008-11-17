require 'test'
plan 12 


def cleanup(name)
	if File.exist?(name)
		File.delete(name)
		if File.exist?(name)
			fail '.exist? on File'
		else
			pass '.exist? on File'
		end
	end
end
f1_name = "file-new-tmp.txt"
cleanup(f1_name)
File.open(f1_name, "w") do |fd|
	is fd.class.to_s, 'File', ".open for File"
	fd.puts("ok 2 - .open w/ mode and block for File")
end
f1 = File.open("file-new-tmp.txt", "r") do |fd|
	line = fd.read()
	print line
	print "\n"
end
$testnum += 1
is f1, nil, '.open w/ block for File'

f2 = File.open(f1_name, "r")
cleanup(f1_name)
is f2.class.to_s, 'File', '.open w/ mode and no block for File'
is f2.path, f1_name, '.path for File'
f2_name = "file-new-tmp2.txt"
f3 = File.open(f2_name, "w")
f3_name = "file-new-tmp3.txt"
f4 = File.new(f3_name, "r+")
f5 = File.new(f1_name, "r")
is f4.class.to_s, 'File', '.new w/ mode on File'
is f4.path, 'file-new-tmp3.txt', '.path for File'
is f3.path, 'file-new-tmp2.txt', '.path for File'
is f2.path, 'file-new-tmp.txt', '.path for File'
is f5.path, 'file-new-tmp.txt', '.path for File'


cleanup(f1_name)
cleanup(f2_name)
cleanup(f3_name)
