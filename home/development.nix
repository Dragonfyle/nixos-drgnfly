{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    ruby
    python3
    nodejs
    phpPackages.composer

    (php84.buildEnv {
      extensions = { enabled, all }: enabled ++ (with all; [
        pdo_mysql
        mysqlnd
      ]);
    })

    cmake
    gcc
    tree-sitter

    postman
  ];
}
