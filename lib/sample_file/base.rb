module SampleFile
  class Base
    def file(type=nil)
      File.open file_path(type)
    end

    def file_path(type=nil)
      raise NotImplementedError, "#{self.class} does not implement the file_path method"
    end

    protected

    def base_path
      @base_path ||= File.expand_path File.join(File.dirname(__FILE__), '..', 'files')
    end

    class << self
      def method_missing method, *args
        instance.send method, *args
      end

      def instance
        @@instance ||= self.new
      end
    end
  end
end
