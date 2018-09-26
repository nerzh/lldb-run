# Lldbrun
 
Welcome to new gem for set breakpoints in files and debug your app with LLDB in terminal.

## Installation

Install LLDB to your system with version 4.0 and above:

    $ sudo apt-get install python-lldb-4.0
    $ sudo apt-get install lldb-4.0

OR

    $ sudo apt-get install python-lldb-6.0
    $ sudo apt-get install lldb-6.0

Install lldbrun to your system:

    $ gem install lldbrun

## Usage
for example on swift. You must declare globak function with name "lldbpoint" and on point where you call this function the LLDB will stop execute for debug your code in terminal

e.g. file main.swift

```swift
import Foundation

func lldbpoint() {}
```

another file.swift
```swift
lldbpoint() // on this point the LLDB will stop execute for debug
```
and run your app with console command "lldbrun" from this gem 

    $ lldbrun -f /Users/username/folder/executable_file_your_app 

### for add options to lldb please use -l option

    $ lldbrun -f /Users/username/folder/executable_file_your_app -l "-o run" 


### Options

#### -s <path to source files>   if you have lldb error: Breakpoint 1: no locations (pending). Then use -s option. With this option the lldbrun will recursively scanning all files from directory <path to source files> and if directory contain many files, then this may not be fast
```bash
lldbrun -s /Users/username/folder_your_app
```
### Other options
#### -f  <path to source files>  path to executable file of your program
```bash
lldbrun -f /Users/username/folder_your_app/bin/executable_file_your_app
```
#### -r  <false>  auto run LLDB after initialize breakpoints. Default - true
```bash
lldbrun -r false
```
#### -r  <false>  auto skip first breakpoint after run. Default - true
```bash
lldbrun -n false
```
#### -l  <"...">  other any standard options of LLDB in quotes "...".
```bash
lldbrun -l "b --name heap_delete --condition 'relation->rd_id == 1259'"
```
#### -h    help.
```bash
lldbrun -h
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/woodcrust/lldb-run

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
