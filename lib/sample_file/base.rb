module SampleFile
  class Base
    def file
      File.open file_path
    end

    def file_path
      raise NotImplementedError, "#{self.class} does not implement the file_path method"
    end

    protected

    def base_path
      @base_path ||= File.expand_path File.join(File.dirname(__FILE__), '..', 'files')
    end
  end
end
