{ pkgs, ... }:

{
  #security.polkit.enable = true;
  #security.polkit.extraConfig = ''
  #  polkit.addRule(function(action, subject) {
  #    var YES = polkit.Result.YES;
  #    var permission = {
  #      "org.freedesktop.udisks2.filesystem-mount": YES,
  #      "org.freedesktop.udisks2.filesystem-mount-system": YES,
  #      "org.freedesktop.udisks2.eject-media": YES
  #    };
  #    return permission[action.id];
  #  });
  #'';
}
