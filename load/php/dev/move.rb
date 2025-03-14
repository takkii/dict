# frozen_string_literal: true

require 'open3'
require 'fileutils'

# Installer runner.
class InstallerRunner
  # default encoding utf-8, change encode here.
  def self.encoding_style
    Encoding.default_internal = 'UTF-8'
    Encoding.default_external = 'UTF-8'
  end

  def self.run
    encoding_style
    if Dir.exist?(File.expand_path('~/php_dict'))
      puts 'Already have a php_dict folder...do nothing.'
    else
      FileUtils.mkdir_p(File.expand_path('~/php_dict'))
      FileUtils.mv(['./php_dict.txt'], "#{ENV['HOME']}/dict")
      puts 'Created, php dictionary folder.'
    end
  end
end

begin
  InstallerRunner.run
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end

__END__
