configure_file("${COMPONENTS_VERSION}/LayoutBox.qml" "${COMPONENTS_VERSION}/LayoutBox.qml")
configure_file("${COMPONENTS_VERSION}/SquareButton.qml" "${COMPONENTS_VERSION}/SquareButton.qml")
configure_file("${COMPONENTS_VERSION}/TextAutoBox.qml" "${COMPONENTS_VERSION}/TextAutoBox.qml")
configure_file("${COMPONENTS_VERSION}/ScrollBar.qml" "${COMPONENTS_VERSION}/ScrollBar.qml")
configure_file("common/qmldir" "common/qmldir")

install(DIRECTORY "${COMPONENTS_VERSION}/" DESTINATION "${QT_IMPORTS_DIR}/SddmComponents")
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/${COMPONENTS_VERSION}/" DESTINATION "${QT_IMPORTS_DIR}/SddmComponents")

install(DIRECTORY "common/" DESTINATION "${QT_IMPORTS_DIR}/SddmComponents")
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/common/" DESTINATION "${QT_IMPORTS_DIR}/SddmComponents")
