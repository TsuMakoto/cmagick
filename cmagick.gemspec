# frozen_string_literal: true

require_relative 'lib/cmagick/version'

Gem::Specification.new do |spec|
  spec.name          = 'cmagick'
  spec.version       = CMagick::VERSION
  spec.authors       = ['TsuMakoto']
  spec.email         = ['tsukamoto@fusic.co.jp']

  spec.summary       = 'A tool to display images on the console'
  spec.description   = <<~EOF
    To display the image programmatically,
    - you can start the web application,
    - save the image and display it again with the tool,
    - or display it with the jupyter notebook.
    However, for me, that one step is very troublesome.
    So I created a tool that allows you to view the image as it is at the console at runtime.
  EOF

  spec.homepage = 'https://github.com/TsuMakoto/cmagick/README.md'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
