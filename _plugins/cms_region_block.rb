module Jekyll
  class CmsRegionBlock < Liquid::Block
    def initialize(tag_name, text, options)
      super
      params = text.to_s.strip.split(',')
      @filename = params.shift.strip + '.json'
      @options = process_params(params)
    end

    include CmsRegionMethods

    private
    
    def get_region_classes(context)
      [get_region_classes_from_options(context),
       get_region_classes_from_inner_html(context)].compact.join(',')
    end

    def get_region_classes_from_inner_html(context)
      inner_contents = inner_html(context)
      # Parse nodes for classes already in there. 
      nil
    end
    
    def inner_html(context)
      @inner_html ||= render_all(@nodelist, context)
    end
    
    def empty_region_content(include_data_path, context)
      inner_html(context)
    end

  end
end


Liquid::Template.register_tag('regionblock', Jekyll::CmsRegionBlock)
