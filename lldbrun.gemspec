
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
  spec.homepage      = "https://github.com/woodcrust/lldb-run"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*']
  spec.bindir        = "bin"
  spec.executables   = ['lldbrun']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
end
