# Return a module that provides a set of scripts thta back up to
# backblaze b2 buckets, using gpg + duplicity

{
  keyId,
  applicationKey,
  bucketName,
  archives,
  keyIds,
}:

{ pkgs, lib, ... }:
let
  b2-bucket = "b2://${keyId}:${applicationKey}@${bucketName}";
  b2-archive-cmds = map (archive: pkgs.writeShellScriptBin "b2-archive-${archive.name}" ''
    ${pkgs.duplicity}/bin/duplicity ${archive.local} \
      ${lib.concatMapStrings (id: " --hidden-encrypt-key ${id}") keyIds} \
      --use-agent \
      ${b2-bucket}/${archive.remote}
  '') archives;

  b2-restore-file-cmds = map (archive: pkgs.writeShellScriptBin "b2-restore-file-${archive.name}" ''
  ${pkgs.duplicity}/bin/duplicity --file-to-restore $1 \
    --use-agent \
    ${b2-bucket}/${archive.remote} "$2"
'') archives;
    
in {
  environment.systemPackages = builtins.concatMap (x: x) [
    b2-archive-cmds
    b2-restore-file-cmds
  ];
}
