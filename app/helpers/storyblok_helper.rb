module StoryblokHelper
  def get_story(story_id)
    get_story_via_api(story_id)
  end

  def render_component(component_object)
    render partial: "shared/rubyblok_components/#{component_object['component']}",
           locals: { component: component_object }
  end

  def render_content(content)
    return if content.blank?

    if content.is_a?(String)
      markdown_renderer.render(content).html_safe
    else
      rich_text_renderer.render(content).html_safe
    end
  end

  def render_story(story)
    render partial: 'shared/rubyblok_components/story', object: story
  end

  private

  def get_story_via_api(story_id)
    GetStoryblokStory.call(story_id:)
  end

  def rich_text_renderer
    ctx = {}
    components = Dir.children("app/views/shared/rubyblok_components").map do |file|
      file.split(".").first.sub(/^_/, "")
    end
    @rich_text_renderer ||=
      Storyblok::Richtext::HtmlRenderer.new.tap do |html_renderer|
        html_renderer.set_component_resolver(lambda { |component, data|
          if components.include?(component)
            ApplicationController.renderer.render(
              partial: "shared/rubyblok_components/#{component}",
              locals: ctx.merge(component: data)
            )
          else
            ""
          end
        })
      end
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def editable_component(component)
    component['_editable']&.html_safe
  end
end
