module SpotifyRequestHandler
  def spotify_request(&block)
      begin
        yield
      rescue RestClient::TooManyRequests => e
        wait_time = e.http_headers[:retry_after]&.to_i
        wait_time ||= 10

        sleep wait_time.seconds

        spotify_request(&block)
      end
    end
end
