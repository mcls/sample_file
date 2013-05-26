require 'fileutils'

module SampleFile
  class Image < Base
    attr_reader :type, :width, :height

    def initialize(type='png', opts={})
      @type = type
      @width = opts[:width]
      @height = opts[:height]
    end

    def file_path
      if width && height
        resized_file_path(type, width, height)
      else
        path_to_image
      end
    end

    protected

    def path_to_image
      if width && height
        File.join(tmpdir, filename)
      else
        File.join(base_path, 'image', filename)
      end
    end

    def filename
      @filename ||= determine_filename
    end

    def determine_filename
      if width && height
        "sample_#{width}x#{height}.#{type}"
      else
        "sample.#{type}"
      end
    end

    def tmpdir
      return @tmpdir if @tmpdir
      @tmpdir ||= File.join(Dir.tmpdir, 'sample_file', 'image')
      ensure_tmpdir_exists
      @tmpdir
    end

    def ensure_tmpdir_exists
      unless File.exists?(tmpdir)
        FileUtils.mkdir_p(tmpdir)
      end
    end

    def path_to_base_image(filename)
      File.join(base_path, 'image', filename)
    end

    def resized_file_path(type, width, height)
      path = File.join(tmpdir, filename)
      create_resized_image(type, width, height, path) unless File.exists?(path)
      path
    end

    def create_resized_image(type, width, height, dst)
      src = resize(file(type).path, width, height).path
      FileUtils.cp(src, dst)
    end

    def resize(path, width, height)
      size = "#{width.to_i}x#{height.to_i}!"
      image = ::MiniMagick::Image.open(path)
      image.resize size
      File.open image.path
    end

  end
end
