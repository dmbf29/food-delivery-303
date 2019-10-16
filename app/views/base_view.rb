class BaseView
  def ask_for_(thing)
    puts "What's the #{thing}"
    gets.chomp
  end
end
