module PublishingApi
  class MinistersIndexPresenter
    attr_accessor :item
    attr_accessor :update_type

    def initialize(item: nil, update_type: nil)
      self.item = nil
      self.update_type = update_type || "major"
    end

    delegate :content_id, to: :item

    def content
      content = BaseItemPresenter.new(
        item,
        title: 'title',
        update_type: update_type,
      ).base_attributes

      content.merge!(
        base_path: "/government/ministers",
        details: details,
        routes: routes,
        publishing_app: "whitehall",
        document_type: 'ministers_index',
        #public_updated_at: Time.zone.now.iso8601,
        rendering_app: Whitehall::RenderingApp::WHITEHALL_FRONTEND,
        schema_name: "ministers_index",
      )
    end

  private

    #def public_updated_at
    def details
      if SitewideSetting.find_by(key: :minister_reshuffle_mode)
        {
          reshuffle: "Reshuffle mode is on"
        }
      else
        {
          reshuffle: "Reshuffle mode is off"
        }
      end
    end

    def routes 
      ["/government/ministers.#{I18n.locale.to_s}"]
    end
  end
end
