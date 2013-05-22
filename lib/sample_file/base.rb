module SampleFile
  class Base
    def file(type=nil)
      File.open file_path(type)
    end

    protected

    def base_path
      @base_path ||= File.expand_path File.join(File.dirname(__FILE__), '..', 'files')
    end
  end
end
