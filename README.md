# Lldbrun
 
Welcome to new gem for set breakpoints in files and debug your app with LLDB in terminal.

## Installation

Install LLDB to your system:

    $ sudo apt-get install lldb

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

#### -f    path to executable file of your program
```bash
lldbrun -f /Users/username/folder_your_app/bin/executable_file_your_app
```
#### -s    root directory for scan breakpoints in all your files. Default - current terminal directory.
###### ATTENTION
###### if do not set -s <path to source files> option, that lldbrun will recursively scanning all files from current directory of terminal for search your breakpoints and this may be not fast
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
```bash
lldbrun -s /Users/username/folder_your_app
```
#### -r    auto run LLDB after initialize breakpoints. Default true
```bash
lldbrun -r false
```
#### -l    other any standard options of LLDB in quotes "...".
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
