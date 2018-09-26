module Lldbrun
  class BreakPoint
    
    attr_reader :file, :line

    def initialize(file, line)
      @file = file
      @line = line
    end

    def lldb_set_breakpoint
      "breakpoint set --file #{file} --line #{line}"
    end

    def self.lldb_set_method_name_breakpoint
      "breakpoint set --name lldbpoint"
    end
  end
end
