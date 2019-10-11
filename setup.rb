#!/usr/bin/env ruby
require 'pathname'

@stash = Pathname.new Dir.pwd
@home = Pathname.new ENV['HOME']
@tmp = Pathname.new "#{@home}/tmp"
@bin  = Pathname.new "#{@home}/bin"
@symlinks = ['.tmux.conf', '.bashrc', '.bash_login', '.gemrc', '.vim', '.vimrc', '.git', '.gitconfig', '.inputrc', '.gitignore', 'bin/2bin', 'bin/cert', 'bin/site+', 'bin/site-']

unless (['setup.rb', '.vimrc', '.inputrc'] - @stash.children.map{|c| c.basename.to_s}).empty? && @stash != @home then
  raise RuntimeError, "Not in stash" 
end

def overwrite_file(file)
  puts "=> Overwrite '#{@home}/#{file}'? [y/n]"
  print "> "
   return (gets =~ /ye?s?/i) ? true : false
end

def symlink_file(file)
  stash_file = @stash + file 
  home_file = @home + file
  if home_file.exist? || home_file.symlink? then
    if overwrite_file(file) then
      home_file.directory? ? home_file.rmtree : home_file.unlink 
    else
      return
    end
  end
  home_file.make_symlink stash_file
  puts "   #{home_file} -> #{stash_file}"
end

unless @tmp.exist? then
  # Make temporary directory
  puts "Creating temporary directory..."
  @tmp.mkdir
end

unless @bin.exist? then
  # Make temporary directory
  puts "Creating bin directory..."
  @bin.mkdir
end

puts "Symlinking stash files..."
@symlinks.each do |s|
  symlink_file(s)
end
puts "Done."


