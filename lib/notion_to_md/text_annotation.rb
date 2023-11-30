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
        if text[-1] == ' '
          "_#{text.strip}_ "
        else
          "_#{text}_"
        end
      end

      def bold(text)
        if text[-1] == ' '
          "**#{text.strip}** "
        else
          "**#{text}**"
        end
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
