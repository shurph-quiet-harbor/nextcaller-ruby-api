module NextcallerClient

  class HttpException < StandardError

    attr_reader :content

    def initialize(content)
      @content = content
    end
  end

  class TooManyRequestsException < HttpException

    attr_reader :content, :retry_after

    def initialize(content, retry_after)
      @content = content
      @retry_after = retry_after
    end
  end

end
