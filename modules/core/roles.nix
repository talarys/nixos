{lib, ...}: {
  options.system.roles = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "List of roles to apply to the system";
  };
}
