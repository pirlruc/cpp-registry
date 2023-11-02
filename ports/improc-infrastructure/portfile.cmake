vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO pirlruc/infrastructure
  REF 852f10c9bc46fa2a22d2290fd3a990553d1a7109
  SHA512 de20e8ae5289f940d0a6d84f74e1b329dcce7454900c6ad7670d1d3100bc2170bd5abb81886c0ace0d3c85a8b2be33f790ca1fcf9848f79d9f2411f23b35c4dc
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