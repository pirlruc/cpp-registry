vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO pirlruc/infrastructure
  REF 34c99d5de87c0f7bb65e935e3f631bd797403f8f
  SHA512 7e1a1fc1e60970880b34ee781789cc2e0ad25a0c26e37f21bc697cb94697d33155e1f987624b349c2895dcfc68f262716e75cc1176d032f6af53ad5dc92c8cc5
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)