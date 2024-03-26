#!/bin/bash

# search and apply special patches for chromium of current board
# patches should be located in the path defined by CHROMIUM_PATCHES_PATH
# or overlay-<board>/chromium-patches/

# The variable CHROMIUM_PATCHES_PATH can be defined in make.conf of overlay-<board>
# or make.conf of it's master repositories.

find_jemaos_patches() {
  local full_patches_dir=""
  local patches_dirs=()
  full_patches_dir=${CHROMIUM_PATCHES_PATH}

  if [[ -z "$full_patches_dir" ]] || [[ ! -d "${full_patches_dir}" ]]; then
    local patches_dir="chromium-patches"
    local revert_search_dir=""
    local overlay_root=""
    for overlay_root in ${BOARD_OVERLAY}; do
      revert_search_dir="$overlay_root $revert_search_dir"
    done
    for overlay_root in $revert_search_dir; do
      full_patches_dir="${overlay_root}/${patches_dir}"
      einfo "find: $full_patches_dir"
      if [[ -d $full_patches_dir ]]; then
        patches_dirs+=($full_patches_dir)
      fi
    done
  else
    patches_dirs+=($full_patches_dir)
  fi

  local patch_dir=""
  for patch_dir in ${patches_dirs[@]}; do
    local patch_file=""
    for patch_file in `find "${patch_dir}" -maxdepth 1 -name '*.patch' | sort -d`; do
      echo $patch_file
    done
  done
}

# use a file as the mark, not a variable in the script, because every phase(src_configure, src_compile...) is new env
JEMAOS_CHROMIUM_PATCHED_MARK_FILE="${WORKDIR}/jemaos_chromium_patched"
mark_patched() {
  touch "$JEMAOS_CHROMIUM_PATCHED_MARK_FILE"
}
mark_reverted() {
  rm -f "$JEMAOS_CHROMIUM_PATCHED_MARK_FILE"
}

unpatches_jemaos() {
  if [[ ! -f "$JEMAOS_CHROMIUM_PATCHED_MARK_FILE" ]]; then
    einfo "Not patched, may reverted already"
    return
  fi
  einfo "Revert jemaos patches.."
  pushd "${CHROME_ROOT}"/src > /dev/null || die "Cannot chdir to ${CHROME_ROOT}/src"
  find_jemaos_patches | sort -r | while read -r p; do
    patch -R -p1 -f -s -g0 --no-backup-if-mismatch -r - < "${p}" || true # ignore reverse patch failure.
  done
  popd || die "Cannot popd from ${CHROME_ROOT}/src"
  mark_reverted
}

unpatches_when_aborted() {
  trap 'unpatches_jemaos; trap - SIGINT SIGTERM SIGQUIT ERR' SIGINT SIGTERM SIGQUIT ERR # avoid unpatches multiple times
}

cros_pre_src_prepare_patches() {
  einfo "Enter jemaos patches.."
  pushd "${CHROME_ROOT}"/src > /dev/null || die "Cannot chdir to ${CHROME_ROOT}/src"
  find_jemaos_patches | while read -r p; do
    einfo "Apply:${p}"
    patch -p1 -f -s -g0 --no-backup-if-mismatch -r - < "${p}" || { unpatches_jemaos; die; }
  done
  popd || die "Cannot popd from ${CHROME_ROOT}/src"
  mark_patched
}

cros_pre_src_configure_setup_unpatches_hook() {
  unpatches_when_aborted
}

cros_pre_src_compile_setup_unpatches_hook() {
  unpatches_when_aborted
}

cros_post_src_compile_setup_unpatches_hook() {
  unpatches_jemaos
}

cros_post_src_install_remove_widevine_placeholder() {
  local WIDEVINE_DIR="$D_CHROME_DIR/WidevineCdm"
  if [[ -d "$WIDEVINE_DIR" ]]; then
    einfo "Remove WidevineCdm placeholder"
    rm -rf "${WIDEVINE_DIR:?}"/_platform_specific/*
  fi
}
