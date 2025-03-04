# frozen_string_literal: true

module NotionToMd
  ##
  # Append the text type:
  # * italic: boolean,
  # * bold: boolean,
  # * striketrough: boolean,
  # * underline: boolean,
  # * code: boolean,
  # * color: string NOT_SUPPORTED

  class TextAnnotation
    class << self
      def italic(text)
        "_#{text.strip}_#{text.append_conditional_space}"
      end

      def bold(text)
        "**#{text.strip}**#{text.append_conditional_space}"
      end

      def strikethrough(text)
        "~~#{text}~~"
      end

      def underline(text)
        "<u>#{text}</u>"
      end

      def code(text)
        "`#{text}`"
      end

      def color(text)
        text
      end
    end
  end
end
