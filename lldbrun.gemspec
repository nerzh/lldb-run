
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lldbrun/version"

Gem::Specification.new do |spec|
  spec.name          = "lldbrun"
  spec.version       = Lldbrun::VERSION
  spec.authors       = ["Oleh Hudeichuk"]
  spec.email         = ["emptystamp@gmail.com"]

  spec.summary       = 'This is gem for scan breakpoints in your code and running lldb'
  spec.description   = 'SCANNER BREAKPOINTS BASED ON LLDB'
  spec.homepage      = "https://github.com/woodcrust/lldbrun"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['lib/**/*']
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = ['lldbrun']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
end
