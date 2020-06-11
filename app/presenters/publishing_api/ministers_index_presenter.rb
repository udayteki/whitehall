module PublishingApi
  class MinistersIndexPresenter
    attr_accessor :item
    attr_accessor :update_type
  
    def initialize(item, update_type: nil)
      self.item = nil
      self.update_type = update_type || "major"
    end

    delegate :content_id, to: :item

    def content
      {
        title:, title,
        locale: locale,
        details: details, 
        publishing_app: "whitehall",
        update_type: update_type,
        document_type: document_type,
        public_updated_at: public_updated_at, #placeholder
        schema_name: "ministers_index"
      }
    end

    
  end
end
