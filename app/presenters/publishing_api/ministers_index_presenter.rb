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
        base_path: base_path,
        details: details,
        document_type: 'ministers_index',
        rendering_app: Whitehall::RenderingApp::WHITEHALL_FRONTEND,
        schema_name: "ministers_index",
      )

      if I18n.locale.to_s == "cy"
        content.merge!(
          PayloadBuilder::Routes.for(base_path, additional_routes: ["cy"])
        )
      else
        content.merge!(
          PayloadBuilder::Routes.for(base_path)
        )
      end
    end

  private

    def details

      details = {}
      setting = SitewideSetting.find_by(key: :minister_reshuffle_mode)

      if setting 
        details = {
          :reshuffle => { 
            :message => setting.on ? setting.govspeak : nil
          }.compact
        } 
      end
      details
    end

    def base_path
      "/government/ministers"
    end

  end
end
