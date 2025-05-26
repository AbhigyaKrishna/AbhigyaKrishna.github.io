module Jekyll
  class MermaidBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @markup = markup.strip
    end

    def render(context)
      # Get the content between the mermaid tags
      content = super.strip
      
      # Generate a simple unique ID for this diagram
      diagram_id = "mermaid-#{rand(100000..999999)}"
      
      # Return the HTML with proper class and ID for Mermaid.js
      <<~HTML
        <div class="mermaid" id="#{diagram_id}">
        #{content}
        </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('mermaid', Jekyll::MermaidBlock)
