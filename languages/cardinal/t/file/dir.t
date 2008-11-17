require 'test'
plan 4

d = Dir.new('.')

files = Dir.entries('.')
if files.include?('tmp')
	pass '.entries on Dir'
	skip ".mkdir on Dir, tmp dir already exists"
else
	Dir.mkdir('./tmp')
	pass '.mkdir on Dir'
	files = Dir.entries('.')
	if files.include?('tmp')
		Dir.rmdir('./tmp')
		files =  Dir.entries('.')
		pass '.entries on Dir'
		is files.include?('tmp'), 'true', '.rmdir on Dir'
	end
end

pwd = Dir.pwd
curdir = Dir.entries(pwd)
Dir.chdir('../')
parentdir = Dir.entries(Dir.getwd)
isnt curdir, parentdir, '.pwd,.chdir, and getwd on Dir'
