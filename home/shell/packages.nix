{pkgs, ...}: {
  home.packages = with pkgs; [
    # System Utilities
    bat # Cat clone with syntax highlighting
    uutils-coreutils-noprefix # Rust implementation of GNU coreutils
    curl # Data transfer tool for URLs
    wget # File retrieval from web servers
    unzip # Extract ZIP archives
    zip # Create ZIP archives
    p7zip # 7z compression utility

    # Disk Usage Analyzers
    dua # Disk usage analyzer with TUI
    gdu # Fast disk usage analyzer
    dust # More intuitive du replacement

    # Process & System Monitoring
    btop # Resource monitor (htop alternative)
    procs # Modern process viewer (ps alternative)

    # File Searching
    fd # User-friendly find alternative
    ripgrep # Ultra-fast grep alternative

    # Version Control
    git # Distributed version control system
    git-lfs # Large file support
    gh # GitHub CLI
    delta # Syntax-highlighting pager
    tig # Text-mode interface for Git
    lazygit # Terminal UI for Git
    gitui # Another terminal UI for Git

    # Development Tools
    hyperfine # Command-line benchmarking tool
    just # Command runner (make alternative)
    devenv # Reproducible development environments
    devbox # Development environment manager
    watchexec # Run commands when files change
    entr # Run commands when files change
    epy # Simple Python package manager
    pokego # Nintendo Switch interaction tool
    zlib # Compression library
    opencode # LLM TUI

    # Programming Languages & Runtimes
    nodejs # JavaScript runtime
    bun # JavaScript runtime & toolkit
    pnpm # Fast JavaScript package manager
    go # Go programming language
    cargo # Rust package manager
    rustc # Rust compiler
    zig # Zig programming language
    stack # Haskell build tool
    cabal-install # Haskell package manager
    ghc # Glasgow Haskell Compiler
    stylua # Lua formatter
    lua-language-server # Lua language server
    gcc # GNU Compiler Collection
    gnumake # GNU Make
    clang-tools # Clang tools

    # Code Quality & Formatting
    alejandra # Nix formatter
    deadnix # Dead code detection for Nix
    statix # Nix linter & suggestions
    nil # Nix language server
    nixfmt-rfc-style # Nix formatter (RFC style)
    hpack # Haskell package manager
    haskell-language-server # Haskell language server
    ghciwatch # GHCi file watcher

    # Editors
    neovim # Vim-based text editor

    # Android Development
    scrcpy # Android device mirroring
    android-tools # Android platform tools
  ];
}
