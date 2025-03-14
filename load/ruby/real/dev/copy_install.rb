#!/usr/bin/ruby

class RubyMethod
  def initialize
    @methods = Class.methods + Object.methods
  end

  def write_to_file
    File.open('method.txt', 'a:utf-8', perm = 0o777) do |f|
      f.puts @methods.sort.uniq
    end

    puts 'Writing the method has finished.'
  end
end

RubyMethod.new.write_to_file
