require 'spec_helper'

describe SampleFile do
  %w(Image Video).each do |class_name|
    klass = const_get("SampleFile::#{class_name}")

    file_method = class_name.downcase
    describe file_method do
      it "should call #file on an instance of #{class_name}" do
        klass.any_instance.should_receive(:file)
        described_class.send file_method
      end
    end

    file_path_method = "#{file_method}_path"
    describe file_path_method do
      it "should call #file_path on an instance of #{class_name}" do
        klass.any_instance.should_receive(:file_path)
        described_class.send file_path_method
      end
    end

  end
end
