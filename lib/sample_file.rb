require "rubygems"
require "bundler/setup"
require "mini_magick"

require "sample_file/version"
require "sample_file/base"
require "sample_file/image"
require "sample_file/video"

module SampleFile
  class << self
    def image(type='png')
      Image.file(type)
    end

    def image_path(type='png')
      Image.file_path(type)
    end

    def video(type='h264')
      Video.file(type)
    end

    def video_path(type='h264')
      Video.file_path(type)
    end
  end
end
