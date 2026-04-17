# Contributing to Rusty Last Epoch Planner

## Reporting bugs

- Ensure the bug was not already reported by searching through existing [issues](https://github.com/Musholic/rusty-last-epoch-planner/issues).
- If the bug can also be reproduced with the official runtime (e.g. by running through wine), please open an issue in the [LEP](https://github.com/Musholic/LastEpochPlanner) repo instead. If you're unsure, feel free to just open it here.
- If possible, use the bug report template to create the issue and provide as much information as possible.

## Contributing code

- Get familiar with the code base before you start. Feel free to reach out through [Discussions](https://github.com/Musholic/rusty-last-epoch-planner/discussions) if you have any questions.
- Ensure the PR description clearly describes the problem and solution. Include the relevant issue number if applicable.

## macOS Development Setup

### 1. Install Lua runtime dependencies

The application requires several Lua C libraries at runtime. Install them using LuaRocks with the LuaJIT backend:

```bash
brew install luajit luarocks

luarocks --lua-version 5.1 install luasocket
luarocks --lua-version 5.1 install luautf8
luarocks --lua-version 5.1 install lua-curl
```

Build and install `lzip` from the bundled source (requires zlib, which is pre-installed on macOS):

```bash
cd lua/libs/lzip && make LUA_IMPL=luajit install
```

### 2. Configure LUA_CPATH

Add the following to your shell profile (`~/.zshrc` or `~/.bash_profile`) so the runtime can locate the installed libraries:

```bash
eval $(luarocks --lua-version 5.1 path)
```

Then reload your shell or run `source ~/.bash_profile`.

### 3. Startup

```bash
cargo run
```

Last Epoch Planner files are automatically downloaded to the following directory on first startup:

- `~/Library/Application Support/RustyLastEpochPlanner`

### Troubleshooting

**Build fails with `library 'luajit-5.1' not found`**

This usually means the build cache points to an old LuaJIT version after a Homebrew upgrade. Run:

```bash
cargo clean && cargo run
```

## Acknowledgments

This project is a fork of [rusty-path-of-building](https://github.com/meehl/rusty-path-of-building) by meehl. The original project provides native Linux support for Path of Building.
