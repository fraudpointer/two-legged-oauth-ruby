module OAuth

  # The TwoLeggedAccessToken is used for the actual "real" web service calls that you perform
  # against Google Apps APIs with 2LO (2 legged authentication).
  # Use this instead of the normal {AccessToken} and it should play out of the box.
  class TwoLeggedAccessToken < AccessToken

    attr_accessor :xoauth_requestor_id

    # @param consumer [OAuth::Consumer] a properly initialized oauth consumer
    # @param xoauth_requestor_id [String] usually the email of the user (user@google-apps-domain.com)
    def initialize(consumer, xoauth_requestor_id)
      super(consumer)
      @xoauth_requestor_id = xoauth_requestor_id
    end

    def request(http_method, path, *arguments)
      Logger.debug("Original OAuth request path : #{path}")
      request_uri = URI.parse(path)

      if xoauth_requestor_id
        xoauth_param = "xoauth_requestor_id=#{xoauth_requestor_id}"
        escaped_xoauth_param = "xoauth_requestor_id=#{CGI.escape(xoauth_requestor_id)}"

        if request_uri.query.present?
          request_uri.query.gsub!(xoauth_param, '')
          request_uri.query.gsub!(escaped_xoauth_param, '')
        end

        request_uri.query = request_uri.query.present? ?
            "#{request_uri.query}&#{escaped_xoauth_param}" :
            "#{escaped_xoauth_param}"

        path = request_uri.to_s
      end

      Logger.debug("Hacked OAuth request path : #{path}")
      super(http_method, path, *arguments)
    end

  end

  # Logger helper
  class Logger

    @@logger = nil

    class StdLogger
      def debug(message)
        puts message
      end
    end

    def self.debug(message)
      logger.debug(message)
    end

    protected

    def self.logger
      @@logger ||= if defined? Rails
                     @@logger = Rails.logger
                   else
                     @@logger = StdLogger.new
                   end
    end

  end

end
