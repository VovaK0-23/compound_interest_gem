# frozen_string_literal: true

require_relative "lib/compound_interest/version"

Gem::Specification.new do |spec|
  spec.name          = "compound_interest"
  spec.version       = CompoundInterest::VERSION
  spec.authors       = ["VovaK0-23"]
  spec.email         = ["71105454+VovaK0-23@users.noreply.github.com"]

  spec.summary       = "Calculate compound interest"
  spec.homepage      = "https://github.com/VovaK0-23/compound_interest_gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/VovaK0-23/compound_interest_gem"
  spec.metadata["changelog_uri"] = "https://github.com/VovaK0-23/compound_interest_gem/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop-rake", "~> 0.5"
  spec.add_development_dependency "rubocop-rspec", "~> 2.3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
