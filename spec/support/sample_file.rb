shared_examples_for 'a sample file' do |file_types=[]|

  describe :file_path do
    context "when no file type is provided" do
      it "should point to an existing file" do
        File.exists?(subject.file_path).should be_true
      end
    end

    file_types.each do |type|
      context "when file_type is #{type}" do
        it "should point to an existing file" do
          File.exists?(subject.file_path(type)).should be_true
        end
      end
    end
  end

  describe :file do
    context "when no file type is provided" do
      it "opens a file using file_path" do
        File.should_receive(:open).with(subject.file_path)
        subject.file
      end
    end

    file_types.each do |type|
      context "when file_type is #{type}" do
        it "opens a file using file_path" do
          File.should_receive(:open).with(subject.file_path(type))
          subject.file(type)
        end
      end
    end
  end

end
