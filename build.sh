#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/PixelExperience/manifest -b ten -g default,-mips,-darwin,-notdefault
git clone https://github.com/maung-bodaz/local_manifest --depth 1 -b AEX-10 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch aosp_whyred-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=zacky
export KBUILD_BUILD_HOST=android-build
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=android-build
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
mka bacon -j8
# build 
