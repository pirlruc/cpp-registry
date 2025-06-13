vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO tplgy/cppcodec
    REF "${VERSION}"
    SHA512 0a7bc08243b88fc1e06fb7c66cd4105504eb42461225fffcb601bfd0eb8c0d002cbd8353f9e405d729135d2e99b61a23be8c25ce2878983c5e49ac2d9d662a93
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
       -DCPPCODEC_BUILD_EXAMPLES=OFF
       -DCPPCODEC_BUILD_TESTING=OFF
       -DCPPCODEC_BUILD_TOOLS=OFF    
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
    

vcpkg_fixup_pkgconfig()