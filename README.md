AppImage Builder for Chawan Web Browser
=======================================

This builds AppImages for [Chawan](https://sr.ht/~bptato/chawan/). Images are [published](https://git.lerch.org/lobo/chawan-appimage/packages) in the packages for this repository.

Note that Nim does not currently support Linux on Arm64. There is an [open issue](https://git.lerch.org/lobo/chawan-appimage/packages). When Nim adds support, I will include a corresponding Arm64 AppImage as well.

A dockerfile used for testing is in the root directory for anyone curious that
would like to build their own AppImage. The AppImages are built via a Gitea action.

AppImages are built on a daily basis at 11:30AM UTC, based on the latest commit on master,
using the latest stable version of nim.

The file name contains the short hash of the commit to Chawan.

The icon I am using for the AppImage is just some public domain thing as the project has no icon.
