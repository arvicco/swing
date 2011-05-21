module SystemHelper

  def windows?
    RUBY_PLATFORM =~ /mswin|windows|mingw/ || cygwin?
  end

  def cygwin?
    RUBY_PLATFORM =~ /cygwin/
  end
end

World(WinGui, SystemHelper)
