# Lldbrun

Welcome to new gem for set breakpoints in files and debug your app with LLDB in terminal.

## Installation

Install LLDB to your system:

    $ sudo apt-get install lldb

Or install it yourself as:

    $ gem install lldbrun

## Usage

##### In order to insert a breakpoint, simply add the word "lldbpoint" to your file. It can be commented out so that your code can be compiled.

1. add to any line of your code word
```bash
lldbpoint
```
2. comment it e.g.
```bash
// lldbpoint
```
3. Compile your app    
4. Run

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

Bug reports and pull requests are welcome on GitHub at https://github.com/woodcrust/lldb-run

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
