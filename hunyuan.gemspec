# frozen_string_literal: true

require_relative "lib/hunyuan/version"

Gem::Specification.new do |spec|
  spec.name = "hunyuan"
  spec.version = Hunyuan::VERSION
  spec.authors = ["Kervin"]
  spec.email = ["kervinchangyu@gmail.com"]

  spec.summary = "Hunyuan - Ruby Gem for Chat Completions with Tencent Hunyuan API"
  spec.description = "Hunyuan is a Ruby gem designed to simplify the integration of the Hunyuan API for chat completions into your Ruby applications. With Hunyuan, you can effortlessly add natural language processing capabilities, enabling your applications to provide intelligent responses to user queries. Whether you're building chatbots, virtual assistants, or any other application that requires text-based interactions, Hunyuan streamlines the process and empowers your Ruby code with advanced chat completion features."
  spec.homepage = "https://github.com/kervinchang/hunyuan"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "https://github.com/kervinchang/hunyuan"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/kervinchang/hunyuan"
  # spec.metadata["changelog_uri"] = "Thttps://github.com/kervinchang/hunyuan"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
