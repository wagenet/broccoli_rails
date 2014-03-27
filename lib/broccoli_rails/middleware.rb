require 'socket'
require 'timeout'

module BroccoliRails
  class Middleware

    def initialize(app)
      @app = app
      @server_started = false
    end

    def call(env)
      if env['PATH_INFO'] =~ %r{/client(/.*)}
        raise "invalid request" unless env['REQUEST_METHOD'] == 'GET'
        start_server

        response = Net::HTTP.get_response("localhost", $1, 4200)

        headers = {}
        response.each_header{|k,v| headers[k] = v }

        [response.code.to_i, headers, [response.read_body]]
      else
        @app.call(env)
      end
    end

    private

      def start_server
        return if @server_started

        Dir.chdir Rails.root do
          # Maybe use popen here and hide the output
          @server_pid = spawn("broccoli serve")
        end

        at_exit { Process.kill("INT", @server_pid) }

        Timeout::timeout(5) do
          until port_open?("localhost", 4200)
            sleep 0.1
          end
        end

        @server_started = true
      rescue Timeout::Error
        raise "server not started"
      end

      def port_open?(ip, port, seconds=1)
        begin
          TCPSocket.new(ip, port).close
          true
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
          false
        end
      end

  end
end