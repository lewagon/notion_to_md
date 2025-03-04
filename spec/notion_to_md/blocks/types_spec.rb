# frozen_string_literal: true

require 'spec_helper'

describe(NotionToMd::Blocks::Types) do
  describe('.code') do
    context('when language is javascript') do
      let(:block_code) do
        {
          caption: [],
          language: 'javascript',
          rich_text: [{
            type: 'text',
            plain_text: 'function fn(a) {\n\treturn a;\n}',
            href: nil,
            text: {
              content: 'function fn(a) {\n\treturn a;\n}',
              link: nil
            },
            annotations: {
              bold: false,
              italic: false,
              strikethrough: false,
              underline: false,
              code: false,
              color: 'default'
            }
          }]
        }
      end

      it { expect(described_class.code(block_code)).to start_with('```javascript') }

      it do
        output = described_class.code(block_code)
        non_wrapped_output = output.lines[1..-2].join
        expect_output = "#{block_code[:rich_text][0][:plain_text]}\n"

        expect(non_wrapped_output).to eq(expect_output)
      end

      it { expect(described_class.code(block_code)).to end_with('```') }
    end

    context('when language is plain text') do
      let(:block_code) do
        {
          caption: [],
          language: 'plain text',
          rich_text: [{
            type: 'text',
            plain_text: 'This is a plain text',
            href: nil,
            text: {
              content: 'This is a plain text',
              link: nil
            },
            annotations: {
              bold: false,
              italic: false,
              strikethrough: false,
              underline: false,
              code: false,
              color: 'default'
            }
          }]
        }
      end

      it { expect(described_class.code(block_code)).to start_with('```text') }

      it do
        output = described_class.code(block_code)
        non_wrapped_output = output.lines[1..-2].join
        expect_output = "#{block_code[:rich_text][0][:plain_text]}\n"

        expect(non_wrapped_output).to eq(expect_output)
      end

      it { expect(described_class.code(block_code)).to end_with('```') }
    end
  end
end
