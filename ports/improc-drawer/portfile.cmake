vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pirlruc/drawer
    REF "${VERSION}"
    SHA512 8220396dff4f193b075eacdd5ce53e70ce43d3ad887a611c4c34d561a47cdd682f9af093c96e5d994c31f79a2bff2eacbc888e4225586f179f9349891b934cf6
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        qrcode      IMPROC_DRAWER_WITH_QRCODE_SUPPORT
        data-matrix IMPROC_DRAWER_WITH_BARCODE_DATA_MATRIX_SUPPORT
        text        IMPROC_DRAWER_WITH_TEXT_SUPPORT
        tests       IMPROC_WITH_TESTS
        tests       IMPROC_WITH_COVERAGE
        tests       IMPROC_DRAWER_WITH_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DIMPROC_OPENCV_DIR="${VCPKG_INSTALLED_DIR}/@TARGET_TRIPLET@/share/@PORT@"
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "improc-drawer")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)