vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pirlruc/corecv
    REF "${VERSION}"
    SHA512 1407cbcad9e5b20d7fbdf96e04b39ee82b859c5eb579b4dcc154cf6b67353a749db011094acd532c0c7e216e1c9cd980436b246fba6606a12dfec7829f8b578b
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        tests IMPROC_WITH_TESTS
        tests IMPROC_WITH_COVERAGE
        tests IMPROC_CORECV_WITH_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DIMPROC_OPENCV_DIR="${VCPKG_INSTALLED_DIR}/@TARGET_TRIPLET@/share/@PORT@"
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "improc-corecv")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)