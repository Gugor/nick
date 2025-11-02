# Nick

`nick` is a **minimalist command-line tool** that helps you create **aliases for your directories** in your shell configuration file (e.g., `.bashrc`, `.zshrc`).  

With `nick`, you can quickly navigate to your favorite projects or directories using short, memorable names.  

---

## Features

- Create custom aliases for directories.
- Automatically detects your shell and configuration file.
- Supports temporary or permanent aliases.
- Minimal, fast, and easy to use.
- Clear, colorful messages during installation.  

---

## Requirements

- Bash or Zsh (or other compatible shell).
- Write permissions for your shell configuration file (`.*rc`).
- Access to `$HOME/.local/bin` for default installation.

---

## Installation

1. Download or clone the repository.
2. Make sure the installation script `config.sh` has execution permissions:

```bash
chmod +x config.sh
```
## Run the installation script
./config.sh

- If `nick` is already installed, the script will ask if you want to uninstall it.
- The script will automatically add `nick` to your `PATH` and set execution permissions.

> [!NOTE]
> By default, `nick` is installed in `$HOME/.local/bin`)

## Usage

nick allows you to create directory aliases directly from the terminal.
```
nick [alias*] [path] [shell]
```

## Parameters

- `alias*:` *required*. The name of the alias you want to create.
- `path:` _Optional_. The directory path the alias points to. If omitted, the current directory is used.
- `shell:` _Optional_. Specify the shell where the alias will be added (bash, zsh, etc.). If omitted, the current shell is used.


If alias is `here`, nick creates an alias for the current directory.
```
Examples
$ nick here
$ nick awesomeproj
$ nick awesomeproj $PWD              # Same as above
$ nick awesomeproj /home/user/Projects/awesome-project
$ nick awesomeproj /home/user/Projects/awesome-project zsh
```
> [!IMPORTANT]
> For now directories with `-` won't work. Aliases can't have `-`, bash interpret this symbols as an option. I'll fix this in the future. For now use
> `/myproject` instead of `my-project` for the directories you want nick to work with. 

## Uninstallation

If `nick` is already installed, running `config.sh` allows you to safely uninstall it:

- Remove the nick binary
- Remove the PATH export from your shell configuration file
- Clean up aliases created automatically

## Contributing

If you want to contribute to nick, open a Pull Request or report issues in the repository.

## License

This project is licensed under the MIT License.

```
MIT License

Copyright (c) 2025 [Your Name or Username]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
