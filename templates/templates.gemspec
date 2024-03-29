# frozen_string_literal: true

require_relative "lib/templates/version"

Gem::Specification.new do |spec|
  spec.name = "templates"
  spec.version = 0.1
  spec.authors = ["April Li"]
  spec.email = ["greatday4april@gmail.com"]

  spec.summary = "self explanatory"
  spec.description = "self explanatory"
  spec.homepage = "https://github.com/greatday4april/algorithm-templates"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/greatday4april/algorithm-templates"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/greatday4april/algorithm-template."
  spec.metadata["changelog_uri"] = "https://github.com/greatday4april/algorithm-templates"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['README.md', 'lib/**/*', 'lib/*']
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
