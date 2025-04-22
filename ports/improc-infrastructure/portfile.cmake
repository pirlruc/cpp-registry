vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pirlruc/infrastructure
    REF "${VERSION}"
    SHA512 3450d34b18d3f5fb8b1cce3b32588a6df7571a69a4d49bb69108f1bc5440f80473ec82c277c584e0ab838f289aa9f9e4c313a5fc6ac0209102984baceeaa6472
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        tests IMPROC_WITH_TESTS
        tests IMPROC_WITH_COVERAGE
        tests IMPROC_INFRASTRUCTURE_WITH_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "improc-infrastructure")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
# configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
