require 'byebug'
module Lldbrun
  class ParserARGV

    DEFAULT_LLDB      = ''
    DEFAULT_START_DIR = `pwd`.strip
    
    PARAMETER_FILE_PATH = '-f'
    PARAMETER_SCAN_DIR  = '-s'
    PARAMETER_HELP      = '-h'
    PARAMETER_RUN       = '-r'
    PARAMETER_LLDB      = '-l'

    attr_reader :argv, :params
    
    def initialize(argv)
      @argv   = argv
      @params = {}

      check_info
      get_params
    end

    def param_file_path
      params[PARAMETER_FILE_PATH] or DEFAULT_START_DIR
    end

    def param_lldb
      params[PARAMETER_LLDB] or DEFAULT_LLDB
    end

    def param_scan_dir
      params[PARAMETER_SCAN_DIR] or DEFAULT_START_DIR
    end

    def param_auto_run?
      params[PARAMETER_RUN] ? params[PARAMETER_RUN] == 'true' : true
    end

    private

    def check_info
      if argv[0].strip == PARAMETER_HELP || argv.count == 0
        info        
      end
    end

    def help
      descriptions  = []
      descriptions << ["#{PARAMETER_FILE_PATH}  <path> executable file of your program"]
      descriptions << ["#{PARAMETER_SCAN_DIR}  <path> root directory for scan breakpoints. Default - current terminal directory"]
      descriptions << ["#{PARAMETER_LLDB}  <' ... '>standard parameters LLDB in quotes -l '...' "]
      descriptions << ["#{PARAMETER_RUN}  <true/false> auto run LLDB after initialize breakpoints"]
      descriptions << ["#{PARAMETER_HELP}  <> this help"]
    end

    def get_params
      argv.each_slice(2).to_a.each do |pair|
        error_params if pair.size != 2
        params[pair[0].strip] = pair[1].strip
      end

      self
    end

    def info
      help.each { |descr| p descr}
      exit 0
    end

    def error_params
      p 'LLDBRUN:  BAD PARAMETERS'
      info
    end
  end
end
