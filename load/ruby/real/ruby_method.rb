# frozen_string_literal: true

# The new instance will be deleted after process ends.
class RubyMethod
  attr_reader :methods

  # Defaut encoding utf8, Encoding change here.
  def encoding_style
    Encoding.default_internal = 'UTF-8'
    Encoding.default_external = 'UTF-8'
  end

  def initialize
    @methods = Class.public_methods + Class.private_methods + Class.protected_methods
  end

  def remove
    encoding_style
    File.open('method.txt', 'a:utf-8', perm = 0o777) do |f|
      f.puts @methods.sort.uniq
    end
    remove_instance_variable(:@methods)
  end
end

# About Exception, begin ~ rescue ~ ensure.
begin
  RubyMethod.new.remove
  puts 'Exported, The RubyMethod to a Text File.'
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end

__END__
