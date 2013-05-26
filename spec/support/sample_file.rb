shared_examples_for 'a sample file' do |file_types=[]|
  subject { described_class.new }

  describe :file_path do
    it { should respond_to(:file_path) }
    context "when no file type is provided" do
      it "should point to an existing file" do
        File.exists?(subject.file_path).should be_true
      end
    end
  end

  describe :file do
    it { should respond_to(:file) }
    context "when no file type is provided" do
      it "opens a file using file_path" do
        File.should_receive(:open).with(subject.file_path)
        subject.file
      end
    end
  end

  file_types.each do |type|
    context "when file_type is #{type}" do
      subject { described_class.new(type) }
      describe :file_path do
        it "should point to an existing file" do
          File.exists?(subject.file_path).should be_true
        end
      end
    end
  end

end
