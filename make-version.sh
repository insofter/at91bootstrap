#!/bin/sh

src_dir="$1"
export_dir="$2"

cd "${src_dir}"
test $? -eq 0 || exit 1

version=`git describe --dirty | sed -e 's/^v//' -e 's/+/-/g'`
test -n "${version}" || exit 1

cd "${export_dir}/board/icdtcp3"
test $? -eq 0 || exit 1

mv "Makefile" "_Makefile"
test -n ${version} || exit 1
cat "_Makefile" | sed -e 's/^VERSION:=.*$/VERSION:="'"${version}"'"/' > "Makefile"
test $? -eq 0 || exit 1
rm "_Makefile"
test $? -eq 0 || exit 1

exit 0

