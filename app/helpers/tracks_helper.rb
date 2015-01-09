module TracksHelper
  def ugly_lyric(lyric)
    lyric_arr = lyric.strip.split("\n")
    lyric_arr.map do |line|
      "<pre>&#9835; #{h(line)}</pre>"
    end.join.html_safe
  end
end
