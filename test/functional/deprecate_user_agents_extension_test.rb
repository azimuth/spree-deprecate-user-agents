require File.dirname(__FILE__) + '/../test_helper'

class DeprecateUserAgentsExtensionTest < Test::Unit::TestCase
  
  # Replace this with your real tests.
  def test_this_extension
    flunk
  end
  
  def test_initialization
    assert_equal File.join(File.expand_path(RAILS_ROOT), 'vendor', 'extensions', 'deprecate_user_agents'), DeprecateUserAgentsExtension.root
    assert_equal 'Deprecate User Agents', DeprecateUserAgentsExtension.extension_name
  end
  
end
