require 'fileutils'

module SampleFile
  class Image < Base
    attr_reader :type, :width, :height

    def initialize(type='png', opts={})
      @type = type
      @width  = opts[:width]  || opts[:height]
      @height = opts[:height] || opts[:width]
    end

    def file_path
      if width && height
        path_to_resized_image
      else
        path_to_base_image
      end
    end

    # Temporary directory where images will be stored
    #
    def tmpdir
      @tmpdir ||= File.join(Dir.tmpdir, 'sample_file', 'image')
    end

    protected

    def path_to_base_image
      @path_to_base_image ||= File.join(base_path, 'image', base_filename)
    end

    def base_filename
      "sample.#{type}"
    end

    def ensure_tmpdir_exists
      FileUtils.mkdir_p(tmpdir) unless File.exists?(tmpdir)
    end

    def path_to_resized_image
      @path_to_resized_image ||= determine_resized_image_path
    end

    def determine_resized_image_path
      destination = File.join(tmpdir, filename)
      ensure_tmpdir_exists
      FileUtils.cp(create_resized_image.path, destination)
      destination
    end

    def filename
      @filename ||= determine_filename
    end

    def determine_filename
      if width && height
        filename_with_dimensions
      else
        base_filename
      end
    end

    def filename_with_dimensions
      "sample_#{width}x#{height}.#{type}"
    end

    def create_resized_image
      image = ::MiniMagick::Image.open(path_to_base_image)
      image.resize "#{width.to_i}x#{height.to_i}!"
      File.open image.path
    end
  end
end
