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
      subject { described_class.new(image_type) }

      describe :file do
        it "is of the correct content type" do
          image = MiniMagick::Image.open subject.file.path
          image.mime_type.should == content_type
        end

        context "when passing :width and :height options" do
          subject { described_class.new(image_type, width: 75, height: 200) }
          it "returns an image of those dimensions" do
            image = MiniMagick::Image.open subject.file.path
            image['width'].should == 75
            image['height'].should == 200
          end
        end
      end

      describe :file_path do
        context "when passing :width and :height options" do
          subject { described_class.new(image_type, width: 75, height: 200) }
          its(:file_path) { should match(/sample_75x200\.#{image_type}$/) }
          it "returns a path to an image that exists" do
            path = subject.file_path
            File.exists?(path).should be_true
          end
        end
      end

    end # context
  end # each image_type

end
