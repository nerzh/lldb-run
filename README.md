# Lldbrun

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/lldbrun`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Install LLDB to your system:

    $ sudo apt-get install lldb

Or install it yourself as:

    $ gem install lldbrun

## Usage

    $ lldbrun -f /Users/username/folder/executable_file_your_app 

## OPTIMAL Usage
```bash
lldbrun -f /Users/username/folder_your_app/bin/executable_file_your_app -s /Users/username/folder_your_app 
```

### Options

#### -f   path to executable file of your program
```bash
lldbrun -f /Users/username/folder_your_app/bin/executable_file_your_app
```
#### -s   root directory for scan breakpoints in all your files. Default - current terminal directory.
```bash
lldbrun -s /Users/username/folder_your_app
```
#### -r   auto run LLDB after initialize breakpoints. Default true
```bash
lldbrun -r false
```
#### -l   other any standard options of LLDB in quotes "...".
```bash
lldbrun -l "b --name heap_delete --condition 'relation->rd_id == 1259'"
```
#### -h   help.
```bash
lldbrun -h
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lldbrun.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
