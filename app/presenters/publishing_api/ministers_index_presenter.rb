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
        title: 'ministers_index',
        update_type: update_type,
      ).base_attributes

      content.merge!(
        base_path: "/government/ministers",
        details: details,
        routes: routes,
        publishing_app: "whitehall",
        document_type: 'ministers_index',
        rendering_app: Whitehall::RenderingApp::WHITEHALL_FRONTEND,
        schema_name: "ministers_index",
      )
    end

  private

    def details
      details = {
          :reshuffle => { :message => ("Reshuffle mode is on" if SitewideSetting.find_by(key: :minister_reshuffle_mode))}.compact
      } 
    end

    def routes 
      routes = [
        {
          :path => "/government/ministers.#{I18n.locale.to_s}",
          :type => "exact"
        },
      ]
    end
  end
end
