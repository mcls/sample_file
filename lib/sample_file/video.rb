module SampleFile
  class Video < Base
    def initialize(type='h264', opts={})
      # TODO Implement provide samples of multiple video codecs
    end

    def file_path
      File.join(video_dir_path, 'h264.mp4')
    end

    protected

    def video_dir_path
      File.join(base_path, 'video')
    end
  end
end
