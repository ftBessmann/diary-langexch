helpers do
  def format_date(object)
    object.strftime "%m/%d/%Y"
  end

  def simple_format(text)
    text.gsub(/\n/, "<br>")
  end

  def sanitize_html(text)
    text.gsub(/(<script>|<\/script>|<style>|<\/style>)|<b>|<\/b>/, "")
  end
end
