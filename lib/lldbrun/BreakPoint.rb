module Lldbrun
  class BreakPoint
    
    attr_reader :file, :line

    def initialize(file, line)
      @file = file
      @line = line
    end

    def lldb_set_breakpoint_command
      "breakpoint set --file #{file} --line #{line}"
    end
  end
end
