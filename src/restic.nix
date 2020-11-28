{
  key-id,
  application-key,
  bucket-name,
  archives,
  pass-cmd,
}:

# where archives is of shape:
# [ { name = "archiveName"; local="~"; repo-path="/path" } ]

{ pkgs, ... }:

let
  restic = "${pkgs.restic}/bin/restic";
  header = ''
    set -euo pipefail
    export B2_ACCOUNT_ID="${key-id}"
    export B2_ACCOUNT_KEY="${application-key}"
  '';
  restic-init-cmds = map (archive: pkgs.writeShellScriptBin "restic-init-${archive.name}" ''
    ${header}
    if ${restic} -r b2:${bucket-name}:${archive.repo} --password-command ${pass-cmd} snapshots
    then false
    fi
    ${restic} -r b2:${bucket-name}:${archive.repo} --password-command ${pass-cmd} init
  '') archives;
  restic-archive-cmds = map (archive: pkgs.writeShellScriptBin "restic-archive-${archive.name}" ''
    ${header}
    ${restic} -r b2:${bucket-name}:${archive.repo} --password-command ${pass-cmd} --verbose backup ${archive.local}
  '') archives;

  restic-restore-cmds = map (archive: pkgs.writeShellScriptBin "restic-restore-${archive.name}" ''
    ${header}
    ${restic} -r b2:${bucket-name}:${archive.repo} --password-command ${pass-cmd} --verbose restore latest --target $1
  '') archives;

in {
  environment.systemPackages = builtins.concatMap (x: x) [
    restic-init-cmds
    restic-archive-cmds
    restic-restore-cmds
  ];
}
