class SampleFile::Video
  def file_path
    File.join(video_dir_path, 'h264.mp4')
  end

  def file
    File.open(file_path)
  end

  protected

  def video_dir_path
    File.join(base_path, 'video')
  end

  def base_path
    @base_path ||= File.expand_path File.join(File.dirname(__FILE__), '..', 'files')
  end
end
