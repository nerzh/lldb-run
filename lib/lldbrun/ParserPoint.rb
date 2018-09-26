module Lldbrun
  class ParserPoint

    LLDBPOINT     = /^[\s\S]+lldbpoint[\s\S]+$/i
    PREV_DIR      = /^\.\./
    CURRENT_DIR   = /^\.$/
    RELATIVE_PATH = /^[\.~]/

    attr_reader :argv_parser, :break_points
    
    def initialize(argv_parser)
      @argv_parser  = argv_parser
      @break_points = []
    end

    def run
      scan_dir(argv_parser.param_scan_dir) if argv_parser.params[ParserARGV::PARAMETER_SCAN_DIR]
      system(generate_start_command)
    end

    private

    def lldb_run_command
      "#{argv_parser.param_lldb} #{argv_parser.param_file_path}"
    end

    def generate_start_command
      lldb_command = lldb_run_command
      lldb_command << lldb_standard_params
      break_points.each do |break_point|
        lldb_command << lldb_breakpoint_by_file_line(break_point)
      end
      lldb_command << lldb_breakpoint_by_method_name
      lldb_command << lldb_run

      lldb_command
    end

    def lldb_breakpoint_by_method_name
      " -o \"#{BreakPoint.lldb_set_method_name_breakpoint}\""
    end

    def lldb_breakpoint_by_file_line(break_point)
      " -o \"#{break_point.lldb_set_breakpoint}\""
    end

    def lldb_standard_params
      ' ' << argv_parser.param_lldb_options
    end

    def lldb_run
      argv_parser.param_auto_run? ? ' -o run' : ''
    end

    def full_path(dir, name)
      "#{dir}/#{name}"
    end

    def absolute_file_path(path)
      absolute_path = ''
      if relative_path?(path)
        absolute_path << "#{`pwd`.strip}/#{path}"
      end

      absolute_path
    end

    def relative_path?(path)
      path[RELATIVE_PATH].to_i
    end

    def scan_file(path)
      File.open(path, File::RDONLY) do |file|
        file.each_with_index do |line, index|
          @break_points << BreakPoint.new(absolute_file_path(path), index + 1) if line.encode("UTF-8", :invalid=>:replace, :replace=>"?")[LLDBPOINT]
        end
        file.close
      end
    end

    def scan_dir(dir)
      Dir.foreach(dir) do |name|
        path = full_path(dir, name)
        next if name[PREV_DIR] || name[CURRENT_DIR]
        if File.directory?(path)
          scan_dir(path)
          next
        end
        scan_file(path)
      end
    end
  end
end
