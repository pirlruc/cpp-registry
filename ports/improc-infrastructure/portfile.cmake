vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pirlruc/infrastructure
    REF "${VERSION}"
    SHA512 a40211e19264b54d3ad6efd17cc1e5b98718dccd2843c55bf9d083aa6b57761fc6e0eb20507a7fd2d8595849584d9b2933c20848787240b4528b88445222e095
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
