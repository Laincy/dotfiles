{
  web-devicons.enable = true;

  # auto complete
  cmp = import ./cmp.nix;
  cmp-nvim-lsp = {
    enable = true;
  };
  cmp-buffer = {
    enable = true;
  };
  cmp-path = {
    enable = true;
  };
  cmp_luasnip = {
    enable = true;
  };
  cmp-cmdline = {
    enable = true;
  };

  lsp = import ./lsp.nix;

  lualine = {
    enable = true;
    settings.options.globalstatus = true;
  };

  neo-tree = import ./neotree.nix;

  none-ls = import ./none-ls.nix;

  telescope = import ./telescope.nix;

  tmux-navigator.enable = true;

  treesitter = import ./treesitter.nix;

  trouble.enable = true;

  markview = import ./markview.nix;

	dap.enable = true;
	dap-ui.enable = true;
	dap-lldb.enable = true;

	presence-nvim.enable = true;
}
