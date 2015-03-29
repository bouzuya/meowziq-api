class Player
  def run
    run_watcher
    @watcher.join
  end

  private

  def play
    p 'play!'
  end

  def run_watcher
    @watcher = Thread.new do
      current_status = nil
      while true
        status = Status.all.first
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
    p 'skip!'
  end

  def stop
    p 'stop!'
  end
end
