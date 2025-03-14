# frozen_string_literal: true

require 'open3'
require 'fileutils'

# Installer runner.
class UnInstallerRunner
  # default encoding utf-8, change encode here.
  def self.encoding_style
    Encoding.default_internal = 'UTF-8'
    Encoding.default_external = 'UTF-8'
  end

  def self.run
    encoding_style
    FileUtils.rm_rf(File.expand_path('~/php_dict'))
    puts 'Deleted, home directory php_dict folder.'
  end
end

begin
  UnInstallerRunner.run
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end

__END__
