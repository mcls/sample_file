# SampleFile

The SampleFile gem provides an easy way to generate files while testing.

## Installation

Add this line to your application's Gemfile:

    gem 'sample_file'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sample_file

## Usage

```ruby
# returns an image file
SampleFile.image 
SampleFile.image :jpg
SampleFile.image :gif
SampleFile.image :png

# absolute path to image
SampleFile.image_path 
SampleFile.image_path :jpg
SampleFile.image_path :gif
SampleFile.image_path :png

# returns a video file
SampleFile.video

# absolute path to video file
SampleFile.video_path 

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
