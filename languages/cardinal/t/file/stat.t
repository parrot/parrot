require 'test'
plan 20

# need a better test for these things. this shows that we at least can parse and execute these commands
name = "file-stat-tmp.txt"
f = File.new(name, "w")
stat = f.stat
isnt stat, nil, '.stat on File'
isnt stat.class, nil, '.class on FileStat'
isnt stat.blksize, nil, '.blksize on FileStat'
isnt stat.directory?, nil, '.directory? on FileStat'
isnt stat.executable?, nil, '.executable? on FileStat'
isnt stat.file?, nil, '.file? on FileStat'
isnt stat.dev, nil, '.dev on FileStat'
isnt stat.ino, nil, '.ino on FileStat'
isnt stat.mode, nil, '.mode on FileStat'
isnt stat.nlink, nil, '.nlink on FileStat'
isnt stat.uid, nil, '.uid on FileStat'
isnt stat.gid, nil, '.gid on FileStat'
isnt stat.rdev, nil, '.rdev on FileStat'
isnt stat.size, nil, '.size on FileStat'
isnt stat.size?, nil, '.size? on FileStat'
isnt stat.atime, nil, '.atime on FileStat'
isnt stat.mtime, nil, '.mtime on FileStat'
isnt stat.ctime, nil, '.ctime on FileStat'
isnt stat.blocks, nil, '.blocks on FileStat'

if File.exist?(name)
	File.delete(name)
	if File.exist?(name)
		fail '.exist? on File'
	else
		pass '.exist? on File'
	end
end
