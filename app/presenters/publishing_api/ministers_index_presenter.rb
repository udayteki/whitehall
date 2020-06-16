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
      content = BaseItemPresenter.new(
        item,
        title: title,
        update_type: update_type, 
      ).base_attributes
      
      content.merge!(
        locale: locale, 
        details: details,
        publishing_app: "whitehall",
        document_type: document_type,
        public_updated_at: public_updated_at,
        schema_name: "ministers_index"
      )
    end

    private

    def details 
      {

      }
  end
end
