# Inofficial HEPForge mirror

Most ebuilds here are experimental and will move to ::science if they are stable and relevant.

## pkgdev

```bash
$ git add 
$ pkgdev commit
```

## Ebuild
### How to create the manifest

```bash
$ pkgdev manifest
```


## Patching (https://forums.gentoo.org/viewtopic-t-1093700-start-0.html)
Usually I follow these steps (I use less package as example)

* unpack package ebuild /usr/portage/sys-apps/less/less-531.ebuild unpack;
* duplicate source code cp -r /var/tmp/portage/sys-apps/less-531/work/less-531/ /var/tmp/portage/sys-apps/less-531/work/less-531.orig
* go in to source directory cd /var/tmp/portage/sys-apps/less-531/work/less-531/ and change necessary files
* go in work directory cd /var/tmp/portage/sys-apps/less-531/work/
* and finally create patch diff -Naru less-531.orig less-531 > your_patch_files.patch

## Random build

Is a chaos monkey approach to keep checking the relevant packages.

## Similar (HEP) Science collections:

* <http://davidchall.github.io/homebrew-hep/formula/>
* <https://github.com/JP-Ellis/PKGBUILD>
* <https://github.com/funtoo/science-kit>
* <https://hepsoftwarefoundation.org/projects.html>
* <http://cfif.ist.utl.pt/~paulo/l.html#l>
* <https://scikit-hep.org/>
* <https://github.com/conan-hep>
