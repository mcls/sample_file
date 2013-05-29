# SampleFile

[![Gem Version](https://badge.fury.io/rb/sample_file.png)](http://badge.fury.io/rb/sample_file) [![Code Climate](https://codeclimate.com/github/mcls/sample_file.png)](https://codeclimate.com/github/mcls/sample_file) [![Build Status](https://travis-ci.org/mcls/sample_file.png?branch=master)](https://travis-ci.org/mcls/sample_file) [![Coverage Status](https://coveralls.io/repos/mcls/sample_file/badge.png?branch=master)](https://coveralls.io/r/mcls/sample_file?branch=master)

The SampleFile gem provides an easy way to generate files while testing.  
*Currently you can generate images and videos.*

## Installation

Add this line to your application's Gemfile:

    gem 'sample_file'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sample_file
    
##### Requirements
    
If you are going to use custom image sizes, you must have ImageMagick or GraphicsMagick installed.

## Usage

```ruby
# returns an image file
SampleFile.image 
SampleFile.image :jpg
SampleFile.image :gif
SampleFile.image :png
SampleFile.image :jpg, width: 300, height: 50

# absolute path to image
SampleFile.image_path 
SampleFile.image_path :jpg
SampleFile.image_path :gif
SampleFile.image_path :png
SampleFile.image_path :jpg, width: 300, height: 50

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
