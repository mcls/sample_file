require 'spec_helper'

describe SampleFile do

  describe :image do
    it "should call #file on a new instance of Image" do
      described_class::Image.should_receive(:file)
      described_class.image
    end
  end

  describe :image_path do
    it "should call #file_path on Image" do
      described_class::Image.should_receive(:file_path)
      described_class.image_path
    end
  end

  describe :video do
    it "should call #file on Video" do
      described_class::Video.should_receive(:file)
      described_class.video
    end
  end

  describe :video_path do
    it "should call #file_path on Video" do
      described_class::Video.should_receive(:file_path)
      described_class.video_path
    end
  end
end
