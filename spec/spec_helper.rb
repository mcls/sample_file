require 'rubygems'
require 'bundler/setup'
require 'coveralls'
Coveralls.wear!

require 'sample_file'
require 'image_spec'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}
