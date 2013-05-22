require 'spec_helper'

describe SampleFile::Video do
  describe :file_path do
    it "should point to an existing file" do
      File.exists?(subject.file_path).should be_true
    end
  end

  describe :file do
    it "opens a file using file_path" do
      File.should_receive(:open).with(subject.file_path)
      subject.file
    end
  end
end
