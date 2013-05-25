require 'rubygems'
require 'bundler/setup'
require 'sample_file'

require 'image_spec'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}
