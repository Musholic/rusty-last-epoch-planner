# Rusty Last Epoch Planner

Rusty Last Epoch Planner is a cross-platform runtime environment for [Last Epoch Planner](https://github.com/Musholic/LastEpochPlanner). Like [SimpleGraphic](https://github.com/PathOfBuildingCommunity/PathOfBuilding-SimpleGraphic), LEP's official runtime environment, it implements the API functions required by LEP's Lua code, handles window management and input, and renders the UI.

This project is a fork of [rusty-path-of-building](https://github.com/meehl/rusty-path-of-building) by meehl, adapted to work with Last Epoch Planner instead of Path of Building.

The primary goal of this project is to provide native Linux support for Last Epoch Planner. It is written in Rust with cross-platform compatibility in mind and also runs on Windows, though testing there has been minimal.

## Usage

```bash
rusty-last-epoch-planner
```

## Installation

### Building from source

`LuaJIT` needs to be installed on your system for the `mlua` crate to compile.

```bash
cargo build --release
```

## Runtime Dependencies

Last Epoch Planner's Lua code requires the following C libraries:

- [Lua-cURLv3](https://github.com/Lua-cURL/Lua-cURLv3)
- [luautf8](https://github.com/starwing/luautf8)
- [luasocket](https://github.com/lunarmodules/luasocket)
- `lzip` - The source is included in this repo under `lua/libs/lzip` and requires [zlib](https://www.zlib.net/) to compile. Build it with `make LUA_IMPL=luajit`.

Please refer to the [Lua documentation](https://www.lua.org/manual/5.1/manual.html#pdf-package.cpath) to see how it locates libraries.

## Known Issues

- If automatic updates fail, navigate to `~/.local/share/RustyLastEpochPlanner/` and delete both the `rlep.version` file and the `Update` directory. This will force a complete re-download of the planner's latest assets and Lua code on the next startup. (Note: Third-party backends, like this project, face challenges supporting the update mechanism. To make it work, fragile workarounds had to be implemented that can break unexpectedly)

## Acknowledgments

Built upon the work of [meehl](https://github.com/meehl).
Original project: [rusty-path-of-building](https://github.com/meehl/rusty-path-of-building).

Many thanks to the original author for the excellent foundation.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
