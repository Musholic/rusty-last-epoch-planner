{pkgs, ...}: {
  languages.rust.enable = true;

  languages.lua = {
    enable = true;
    package = pkgs.luajit;
  };

  packages = with pkgs; [
    wayland
    libxkbcommon
    vulkan-loader
    zlib
    luajitPackages.luautf8
    luajitPackages.luasocket
    luajitPackages.lua-curl
    (luajit.pkgs.buildLuaPackage {
      pname = "lzip";
      version = "v0.1.0";
      src = ./lua/libs/lzip;

      nativeBuildInputs = [pkg-config];
      buildInputs = [zlib];
      installFlags = ["LUA_CMOD=$(out)/lib/lua/${luajit.luaversion}"];
    })
  ];

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.wayland
    pkgs.libxkbcommon
    pkgs.vulkan-loader
  ];

  # See full reference at https://devenv.sh/reference/options/
}
