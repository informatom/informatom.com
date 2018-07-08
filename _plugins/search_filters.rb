module Jekyll
  module SearchFilters
    #   {{ string | strip_the_newlines }}
    def strip_the_newlines(content)
      content.gsub("\n", ' ').squeeze(' ')
    end
  end
end

Liquid::Template.register_filter(Jekyll::SearchFilters)