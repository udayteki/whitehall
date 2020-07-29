require "test_helper"

class PublishingApi::MinistersIndexPresenterTest < ActionView::TestCase
  def presented_item
    PublishingApi::MinistersIndexPresenter.new
  end

  test "presenter is valid against ministers index schema" do
    create(:sitewide_setting, key: :minister_reshuffle_mode, on: true)

    assert_valid_against_schema(presented_item.content, "ministers_index")
  end

  test "presents ministers index page ready for the publishing-api in english" do
    create(:sitewide_setting, key: :minister_reshuffle_mode, on: false)
    I18n.locale = :en

    expected_hash = {
      title: "ministers_index",
      locale: "en",
      publishing_app: "whitehall",
      redirects: [],
      update_type: "major",
      base_path: "/government/ministers",
      details: {},
      document_type: "ministers_index",
      rendering_app: "whitehall-frontend",
      schema_name: "ministers_index",
      routes: [
        {
          path: "/government/ministers",
          type: "exact",
        },
      ],
    }

    assert_equal expected_hash, presented_item.content
  end

  test "presents ministers index page ready for the publishing-api in english with reshuffle mode" do
    create(:sitewide_setting, key: :minister_reshuffle_mode, on: true)
    I18n.locale = :en

    expected_hash = {
      title: "ministers_index",
      locale: "en",
      publishing_app: "whitehall",
      redirects: [],
      update_type: "major",
      base_path: "/government/ministers",
      details: {
        reshuffle: {
          message: "example text",
        },
      },
      document_type: "ministers_index",
      rendering_app: "whitehall-frontend",
      schema_name: "ministers_index",
      routes: [
        {
          path: "/government/ministers",
          type: "exact",
        },
      ],
    }

    assert_equal expected_hash, presented_item.content
  end

  test "presents ministers index page ready for the publishing-api in welsh" do
    create(:sitewide_setting, key: :minister_reshuffle_mode, on: false)
    I18n.locale = :cy

    expected_hash = {
      title: "ministers_index",
      locale: "cy",
      publishing_app: "whitehall",
      redirects: [],
      update_type: "major",
      base_path: "/government/ministers.cy",
      details: {},
      document_type: "ministers_index",
      rendering_app: "whitehall-frontend",
      schema_name: "ministers_index",
      routes: [
        {
          path: "/government/ministers.cy",
          type: "exact",
        },
      ],
    }

    assert_equal expected_hash, presented_item.content
  end
end
