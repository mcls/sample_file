require 'spec_helper'

describe SampleFile::Image do
  image_types = {
    gif: 'image/gif',
    png: 'image/png',
    jpg: 'image/jpeg'
  }

  image_types.each_pair do |image_type, content_type|
    context "when requesting a '#{image_type}' image" do
      describe :file_path do
        it "should point to a valid file" do
          File.exists?(subject.file_path(image_type)).should be_true
        end
      end

      describe :file do
        it "opens a file using file_path" do
          File.should_receive(:open).with(subject.file_path(image_type))
          subject.file(image_type)
        end

        it "is of the correct content type" do
          data = ImageSpec.new(subject.file(image_type))
          data.content_type.should == content_type
        end
      end
    end
  end

end
