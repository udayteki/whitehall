require "test_helper"

class PublishingApi::MinistersIndexPresenterTest < ActionView::TestCase
  def present(options = {})
    PublishingApi::MinistersIndexPresenter.new
  end

  test "presenter is valid against ministers index schema" do
    presented_item = present()

    assert_valid_against_schema(presented_item.content, "ministers_index")
  end
end
