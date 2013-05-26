require "rubygems"
require "bundler/setup"
require "mini_magick"

require "sample_file/version"
require "sample_file/base"
require "sample_file/image"
require "sample_file/video"

module SampleFile
  class << self
    def image(type='png', opts={})
      Image.new(type, opts).file
    end

    def image_path(type='png', opts={})
      Image.new(type, opts).file_path
    end

    def video(type='h264', opts={})
      Video.new(type, opts).file
    end

    def video_path(type='h264', opts={})
      Video.new(type, opts).file_path
    end
  end
end
