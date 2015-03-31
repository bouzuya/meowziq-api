class Player
  def run
    @player_pid = nil
    @play_next = true
    @player = nil
    @watcher = nil

    run_watcher
    @watcher.join
  end

  private

  def play
    return if @player_pid
    @play_next = true
    @player_pid = nil
    @player = Thread.new do
      while @play_next
        sleep 1

        next_song = Song.next
        next unless next_song
        next_song.deleted_at = Time.zone.now
        next_song.save!
        update_playing! next_song

        # play
        if File.exists? next_song.path
          @player_pid = spawn "mplayer #{next_song.path}"
          player = Process.detach @player_pid
          player.join
          update_playing! nil
        end
      end
    end
  end

  def run_watcher
    @watcher = Thread.new do
      current_status = nil
      while true
        status = Status.first
        case status.text
        when 'play' then
          current_status = 'play'
          play
        when 'stop' then
          current_status = 'stop'
          stop
        when 'skip' then
          current_status = 'skip'
          skip
          current_status = 'play' # to ignore the following update
          status.text = 'play'
          status.save!
        else
          p "unknown status #{status.text}"
        end unless status.text == current_status
        sleep 1
      end
    end
  end

  def skip
    return unless @player_pid
    @play_next = true
    Process.kill :TERM, @player_pid
    @player_pid = nil
  end

  def stop
    return unless @player_pid
    @play_next = false
    Process.kill :TERM, @player_pid
    @player_pid = nil
  end

  private

  def update_playing!(song)
    status = Status.first
    status.song = song
    status.save!
  end
end
