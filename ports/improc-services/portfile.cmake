vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pirlruc/services
    REF "${VERSION}"
    SHA512 87b86430e0889d51f98bcf998d371d79d1045544bcdbdb49d89a001ca2e993a1a6cb308d96e99ef97d2d52faa4f55cfa342fc341229150288c9ae928e8ec0fb5
    HEAD_REF feature-vcpkg
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        tests IMPROC_WITH_TESTS
        tests IMPROC_WITH_COVERAGE
        tests IMPROC_SERVICES_WITH_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "improc-services")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)