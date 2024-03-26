jemaos_stack_bashrc() {
  local cfg cfgd

  cfgd="/mnt/host/source/src/overlays/project-jemaos/${CATEGORY}/${PN}"
  for cfg in ${PN} ${P} ${PF} ; do
    cfg="${cfgd}/${cfg}.bashrc"
    [[ -f ${cfg} ]] && . "${cfg}"
  done

  export JEMAOS_BASHRC_FILESDIR="${cfgd}/files"

  cfgd_patches="/mnt/host/source/src/overlays/project-jemaos-patches/${CATEGORY}/${PN}"
  for cfg in ${PN} ${P} ${PF} ; do
    cfg="${cfgd_patches}/${cfg}.bashrc"
    [[ -f ${cfg} ]] && . "${cfg}"
  done

  export JEMAOS_PATCHES_BASHRC_FILESDIR="${cfgd_patches}/files"
}

jemaos_stack_bashrc
