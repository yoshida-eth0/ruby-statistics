require 'statistics'

filenames = Dir["#{File.dirname(__FILE__)}/core_ext/*.rb"].sort.map do |path|
  File.basename(path, '.rb')
end

# deprecated
filenames -= %w(blank)

filenames.each { |filename| require "statistics/core_ext/#{filename}" }
