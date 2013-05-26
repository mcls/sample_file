module SampleFile
  class Image < Base
    def file_path(type='png', opts={})
      filename = filename_for_type(type)
      File.join(image_dir_path, filename)
    end

    def file(type='png', opts={})
      file = super
      return resize(file.path, opts[:width], opts[:height]) if opts[:width] && opts[:height]
      file
    end

    protected

    def resize(path, width, height)
      size = "#{width.to_i}x#{height.to_i}!"
      image = ::MiniMagick::Image.open(path)
      image.resize size
      File.open image.path
    end

    def image_dir_path
      File.join(base_path, 'image')
    end

    def filename_for_type(type)
      "sample.#{type}"
    end
  end
end
