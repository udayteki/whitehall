require "test_helper"

class PublishingApi::MininstersIndexPresenterTest < ActionView::TestCase
  def present(model_instance, options = {})
    PublishingApi::MinistersIndexPresenter.new(model_instance, options)
  end

  test "presenter is valid against ministers index schema" do
    ministers_index = create(:ministers_index)

    presented_item = present(ministers_index)
    assert_valid_against_schema(presented_item.content, "ministers_index")
  end
end
