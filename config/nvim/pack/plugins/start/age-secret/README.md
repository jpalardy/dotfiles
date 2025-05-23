# Neovim AGE Plugin

_(Originally forked from [histrio/age-secret.nvim](https://github.com/histrio/age-secret.nvim), but now disconnected due to major changes that I don't expect to send upstream.)_

## Description

This Neovim plugin provides seamless integration for handling AGE encrypted
files, specifically focusing on files with the `.age` extension. It automates
the encryption and decryption process, allowing for a smooth workflow within
Neovim. Features

- Automatically decrypts `.age` files upon opening.
- Encrypts `.age` files before saving.

## Installation

Using packer.nvim

```lua
use {
  'jpalardy/age-secret.nvim',
  config = function()
    require('age_secret').setup({
      -- Configuration options, see below
    })
  end
}
```


## Configuration

To configure, set the `AGE_RECIPIENT` and `AGE_IDENTITY` environment variables
in your shell or operating system. Alternatively, you can configure these
settings within Neovim:

```lua
require('age_secret').setup({
  recipient = "age1...",      -- Replace with your AGE recipient
  identity = "~/age-key.txt", -- Replace with your AGE identity
  executable = "rage",        -- Replace with your AGE executable (default: age)
})
```

## Usage

- Open a `.age` file - it will be automatically decrypted.
- Save a `.age` file - it will be automatically encrypted.

## Requirements

[age](https://github.com/FiloSottile/age) and/or
[rage](https://github.com/str4d/rage) installed and configured on your system.

## Contributing

Contributions are welcome! If you have a feature request, bug report, or
suggestion, please open an issue on the GitHub repository.

## License

This plugin is released under the MIT License.
