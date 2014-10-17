module NextcallerClient

  class HttpException < StandardError

    attr_reader :content

    def initialize(content)
      @content = content
    end
  end

end
