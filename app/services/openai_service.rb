# app/services/openai_service.rb
require 'openai'

class OpenaiService
  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_ACCESS_TOKEN'])
  end

  def generate_enhanced_content(input_text)
    response = @client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: input_text,
        max_tokens: 150
      }
    )
    response['choices'][0]['text']
  end
end
