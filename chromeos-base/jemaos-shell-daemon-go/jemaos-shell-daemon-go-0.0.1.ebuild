# Copyright (c) 2022 Jema Technology# Distributed under the license specified in the root directory of this project.

EAPI="6"


EGIT_REPO_URI="${JEMAOS_GIT_HOST_URL}/jemaos-shell-daemon-go.git"
EGIT_BRANCH="main"

inherit git-r3 golang-build
DESCRIPTION="jemaos shell daemon in golang, the replacement of python version"
HOMEPAGE="http://jemakey.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="amd64 arm arm64"
IUSE=""

RDEPEND="
  !chromeos-base/jemaos-shell-daemon
  !chromeos-base/jemaos-shell-daemon-bin
  "

DEPEND="${RDEPEND}
  dev-lang/go
  dev-go/dbus
"

EGO_PN="jemaos.com/shell_daemon"


src_compile() {
   GOARCH=$ARCH GO111MODULE=off golang-build_src_compile
}

get_golibdir() {
  echo "/usr/lib/gopath"
}

src_install() {
  insinto /usr/share/jemaos_shell
  insinto /etc/init
  doins init/jemaos-shell-daemon.conf
  insinto /etc/dbus-1/system.d
  doins dbus/io.jemaos.ShellDaemon.conf
  exeinto /usr/share/jemaos_shell
  doexe script/*
  doexe shell_daemon
}
