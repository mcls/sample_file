require 'spec_helper'

describe SampleFile::Image do
  it_behaves_like "a sample file", %w(gif png jpg)

  image_types = {
    gif: 'image/gif',
    png: 'image/png',
    jpg: 'image/jpeg'
  }

  image_types.each_pair do |image_type, content_type|
    context "when requesting a '#{image_type}' image" do
      describe :file do
        it "is of the correct content type" do
          file = subject.file(image_type)
          data = MiniMagick::Image.open file.path
          data.mime_type.should == content_type
        end

        context "when passing :width and :height options" do
          it "returns an image of those dimensions" do
            image = subject.file(image_type, width: 75, height: 200)
            data = MiniMagick::Image.open image.path
            data['width'].should == 75
            data['height'].should == 200
          end
        end
      end
    end
  end

end
