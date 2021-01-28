# frozen_string_literal: true

require_relative "lib/strict_todo/version"

Gem::Specification.new do |spec|
  spec.name          = "strict-todo"
  spec.version       = StrictTodo::VERSION
  spec.authors       = ["tunagohan"]
  spec.email         = ["kazuxtuna@gmail.com"]

  spec.summary       = "Strict to do management."
  spec.description   = "Strict to do management. Have them describe who will do what by when. This is to avoid leaving meaningless to do."
  spec.homepage      = "https://github.com/tunagohan/strict-todo"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
