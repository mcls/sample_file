module SampleFile
  class Video < Base
    def file_path(type='h264')
      File.join(video_dir_path, 'h264.mp4')
    end

    protected

    def video_dir_path
      File.join(base_path, 'video')
    end
  end
end
