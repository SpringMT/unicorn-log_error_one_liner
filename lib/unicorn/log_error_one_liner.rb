require 'unicorn'

module Unicorn
  def self.log_error(logger, prefix, exc)
    message = exc.message
    message = message.dump if /[[:cntrl:]]/ =~ message
    backtrace_str = exc.backtrace.join(' ')
    logger.error "#{prefix}: #{message} (#{exc.class}) #{backtrace_str}"
  end
end

