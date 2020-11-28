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
  b2-prefix = "b2:${bucket-name}";
  b2-env-creds = ''
    export B2_ACCOUNT_ID="${key-id}"
    export B2_ACCOUNT_KEY="${application-key}"
  '';
  restic-init-cmds = map (archive: pkgs.writeShellScriptBin "restic-init-${archive.name}" ''
    set -euo pipefail
    ${b2-env-creds}
    if ${restic} -r b2:${bucket-name}:${archive.repo} --password-command ${pass-cmd} snapshots
    then false
    fi
    ${restic} -r b2:${bucket-name}:${archive.repo} --password-command ${pass-cmd} init
  '') archives;
  # restic-archive-cmds = map (archive: pkgs.writeShellScriptBin "restic-init-${archive.name}" ''
    
  # '') archives;
                          
in {
  environment.systemPackages = builtins.concatMap (x: x) [
    restic-init-cmds
    # restic-archive-cmds
    # restic-restore-file-cmds
  ];
}
