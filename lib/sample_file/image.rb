module SampleFile
  class Image < Base
    def file_path(type='png')
      filename = filename_for_type(type)
      File.join(image_dir_path, filename)
    end

    def file(type='png')
      super
    end

    protected

    def image_dir_path
      File.join(base_path, 'image')
    end

    def filename_for_type(type)
      "sample.#{type}"
    end
  end
end
