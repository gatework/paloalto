# frozen_string_literal: true

require "minitest/autorun"
require "paloalto"

class PaloaltoTest < Minitest::Test
  def test_version_matches_gemspec
    spec = Gem::Specification.load(File.expand_path("../paloalto-rb.gemspec", __dir__))
    assert_equal Paloalto::VERSION, spec.version.to_s
    assert_equal "paloalto-rb", spec.name
  end

  def test_errors_can_be_rescued_as_standard_errors
    assert_operator Paloalto::Error, :<, StandardError
  end

  def test_package_contains_only_library_and_documentation
    spec = Gem::Specification.load(File.expand_path("../paloalto-rb.gemspec", __dir__))
    assert_equal %w[CHANGELOG.md LICENSE README.md lib/paloalto.rb lib/paloalto/version.rb], spec.files.sort
  end
end
