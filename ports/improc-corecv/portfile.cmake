vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pirlruc/corecv
    REF "${VERSION}"
    SHA512 35bbbe3372b719f24ca15c663900fc3604145b9a8201e2298621fccaeab8d0b057c5c34709d068dade2b30ba68e82a20d172be82fd62a2ceeadb04f0f1c17c0c
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