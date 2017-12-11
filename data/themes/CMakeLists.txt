# <<<<<<< HEAD
set(THEMES autocomp elarun maldives maya pinkList)
# =======
# set(THEMES elarun maldives maya pinkList)
# >>>>>>> pinkList

foreach(THEME ${THEMES})
    # We assume that theme-specific translations are stored
    # in ${THEME}/translations directory
    set(TRANSLATIONS_DIR "${THEME}/translations")
    file(GLOB TRANSLATION_SOURCES "${TRANSLATIONS_DIR}/*.ts")

    # start - AutoComp feature
    if("${THEME}" STREQUAL "pinkList")
        configure_file("${THEME}/LICENSE"                                 "${THEME}/LICENSE" COPYONLY)
        configure_file("${THEME}/README"                                  "${THEME}/README" COPYONLY)
        
        configure_file("${THEME}/angle-down.png"                          "${THEME}/angle-down.png" COPYONLY)
        configure_file("${THEME}/background.jpg"                          "${THEME}/background.jpg" COPYONLY)
        
        configure_file("${THEME}/pinkList.mp4"                            "${THEME}/pinkList.mp4" COPYONLY)
        configure_file("${THEME}/listBox.png"                             "${THEME}/listBox.png" COPYONLY)

        configure_file("${THEME}/qt.gif"                                  "${THEME}/qt.gif" COPYONLY)
        
        configure_file("${THEME}/images/albano.png"                       "${THEME}/images/albano.png" COPYONLY)
        configure_file("${THEME}/images/alberta.png"                      "${THEME}/images/alberta.png" COPYONLY)
        configure_file("${THEME}/images/albino.png"                       "${THEME}/images/albino.png" COPYONLY)
        configure_file("${THEME}/images/background.png"                   "${THEME}/images/background.png" COPYONLY)
        configure_file("${THEME}/images/lock.png"                         "${THEME}/images/lock.png" COPYONLY)
        configure_file("${THEME}/images/login_active.png"                 "${THEME}/images/login_active.png" COPYONLY)
        configure_file("${THEME}/images/login_normal.png"                 "${THEME}/images/login_normal.png" COPYONLY)
        configure_file("${THEME}/images/Person-Male-Light-icon.png"       "${THEME}/images/Person-Male-Light-icon.png" COPYONLY)
        configure_file("${THEME}/images/rectangle_overlay.png"            "${THEME}/images/rectangle_overlay.png" COPYONLY)
        configure_file("${THEME}/images/rectangle.png"                    "${THEME}/images/rectangle.png" COPYONLY)
        configure_file("${THEME}/images/session_normal.png"               "${THEME}/images/session_normal.png" COPYONLY)
        configure_file("${THEME}/images/system_hibernate.png"             "${THEME}/images/system_hibernate.png" COPYONLY)
        configure_file("${THEME}/images/system_reboot.png"                "${THEME}/images/system_reboot.png" COPYONLY)
        configure_file("${THEME}/images/system_shutdown.png"              "${THEME}/images/system_shutdown.png" COPYONLY)
        configure_file("${THEME}/images/system_suspend.png"               "${THEME}/images/system_suspend.png"  COPYONLY)
        configure_file("${THEME}/images/system_switch_user.png"           "${THEME}/images/system_switch_user.png" COPYONLY)
        configure_file("${THEME}/images/user_icon.png"                    "${THEME}/images/user_icon.png" COPYONLY)
    endif()

    if("${THEME}" STREQUAL "autocomp")
        configure_file("${THEME}/angle-down.png"                          "${THEME}/angle-down.png" COPYONLY)
        configure_file("${THEME}/background.jpg"                          "${THEME}/background.jpg" COPYONLY)
        configure_file("${THEME}/maldives.jpg"                            "${THEME}/maldives.jpg" COPYONLY)
        configure_file("${THEME}/qt.gif"                                  "${THEME}/qt.gif" COPYONLY)
        configure_file("${THEME}/rectangle.png"                           "${THEME}/rectangle.png" COPYONLY)
        configure_file("${THEME}/images/albano.png"                       "${THEME}/images/albano.png" COPYONLY)
        configure_file("${THEME}/images/alberta.png"                      "${THEME}/images/alberta.png" COPYONLY)
        configure_file("${THEME}/images/albino.png"                       "${THEME}/images/albino.png" COPYONLY)
        configure_file("${THEME}/images/background.png"                   "${THEME}/images/background.png" COPYONLY)
        configure_file("${THEME}/images/lock.png"                         "${THEME}/images/lock.png" COPYONLY)
        configure_file("${THEME}/images/login_active.png"                 "${THEME}/images/login_active.png" COPYONLY)
        configure_file("${THEME}/images/login_normal.png"                 "${THEME}/images/login_normal.png" COPYONLY)
        configure_file("${THEME}/images/Person-Male-Light-icon.png"       "${THEME}/images/Person-Male-Light-icon.png" COPYONLY)
        configure_file("${THEME}/images/rectangle_overlay.png"            "${THEME}/images/rectangle_overlay.png" COPYONLY)
        configure_file("${THEME}/images/rectangle.png"                    "${THEME}/images/rectangle.png" COPYONLY)
        configure_file("${THEME}/images/session_normal.png"               "${THEME}/images/session_normal.png" COPYONLY)
        configure_file("${THEME}/images/system_hibernate.png"             "${THEME}/images/system_hibernate.png" COPYONLY)
        configure_file("${THEME}/images/system_reboot.png"                "${THEME}/images/system_reboot.png" COPYONLY)
        configure_file("${THEME}/images/system_shutdown.png"              "${THEME}/images/system_shutdown.png" COPYONLY)
        configure_file("${THEME}/images/system_suspend.png"               "${THEME}/images/system_suspend.png"  COPYONLY)
        configure_file("${THEME}/images/system_switch_user.png"           "${THEME}/images/system_switch_user.png" COPYONLY)
        configure_file("${THEME}/images/user_icon.png"                    "${THEME}/images/user_icon.png" COPYONLY)
    endif()

    if("${THEME}" STREQUAL "elarun")
        configure_file("${THEME}/elarun.jpg"                      "${THEME}/elarun.jpg" COPYONLY)
        configure_file("${THEME}/angle-down.png"                  "${THEME}/angle-down.png" COPYONLY)
        configure_file("${THEME}/images/background.png"           "${THEME}/images/background.png" COPYONLY)
        configure_file("${THEME}/images/lock.png"                 "${THEME}/images/lock.png" COPYONLY)
        configure_file("${THEME}/images/login_active.png"         "${THEME}/images/login_active.png" COPYONLY)
        configure_file("${THEME}/images/login_normal.png"         "${THEME}/images/login_normal.png" COPYONLY)
        configure_file("${THEME}/images/rectangle_overlay.png"    "${THEME}/images/rectangle_overlay.png" COPYONLY)
        configure_file("${THEME}/images/rectangle.png"            "${THEME}/images/rectangle.png" COPYONLY)
        configure_file("${THEME}/images/session_normal.png"       "${THEME}/images/session_normal.png" COPYONLY)
        configure_file("${THEME}/images/system_hibernate.png"     "${THEME}/images/system_hibernate.png" COPYONLY)
        configure_file("${THEME}/images/system_reboot.png"        "${THEME}/images/system_reboot.png" COPYONLY)
        configure_file("${THEME}/images/system_shutdown.png"      "${THEME}/images/system_shutdown.png" COPYONLY)
        configure_file("${THEME}/images/system_suspend.png"       "${THEME}/images/system_suspend.png" COPYONLY)
        configure_file("${THEME}/images/system_switch_user.png"   "${THEME}/images/system_switch_user.png" COPYONLY)
        configure_file("${THEME}/images/user_icon.png"            "${THEME}/images/user_icon.png" COPYONLY)
    endif()

    if("${THEME}" STREQUAL "maldives")
        configure_file("${THEME}/background.jpg"                  "${THEME}/background.jpg" COPYONLY)
        configure_file("${THEME}/maldives.jpg"                    "${THEME}/maldives.jpg" COPYONLY)
        configure_file("${THEME}/angle-down.png"                  "${THEME}/angle-down.png" COPYONLY)
        configure_file("${THEME}/rectangle.png"                   "${THEME}/rectangle.png" COPYONLY)
    endif()

    if("${THEME}" STREQUAL "maya")
        configure_file("${THEME}/components/SpButton.qml"                         "${THEME}/components/SpButton.qml")
        configure_file("${THEME}/components/SpClock.qml"                          "${THEME}/components/SpClock.qml")
        configure_file("${THEME}/fonts/OpenSans_CondLight.ttf"                    "${THEME}/fonts/OpenSans_CondLight.ttf" COPYONLY)
        configure_file("${THEME}/images/ic_arrow_drop_down_white_24px.svg"        "${THEME}/images/ic_arrow_drop_down_white_24px.svg" COPYONLY)
        configure_file("${THEME}/images/ic_power_settings_new_white_24px.svg"     "${THEME}/images/ic_power_settings_new_white_24px.svg" COPYONLY)
        configure_file("${THEME}/images/ic_refresh_white_24px.svg"                "${THEME}/images/ic_refresh_white_24px.svg" COPYONLY)
        configure_file("${THEME}/images/ic_warning_white_24px.svg"                "${THEME}/images/ic_warning_white_24px.svg" COPYONLY)
        configure_file("${THEME}/screenshots/hi_IN.png"                           "${THEME}/screenshots/hi_IN.png" COPYONLY)
    endif()

    configure_file("${THEME}/theme.conf"                "${THEME}/theme.conf")
    # end - AutoComp feature
    configure_file("${THEME}/Main.qml"                  "${THEME}/Main.qml")
    configure_file("${THEME}/metadata.desktop"          "${THEME}/metadata.desktop")

    set_source_files_properties(${TRANSLATION_SOURCES} PROPERTIES OUTPUT_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/${TRANSLATIONS_DIR}")

    qt5_add_translation(QM_FILES "${TRANSLATION_SOURCES}")

# <<<<<<< HEAD
#    install(DIRECTORY "${THEME}" DESTINATION "${DATA_INSTALL_DIR}/themes" PATTERN "${THEME}/*.ts" 
#            EXCLUDE PATTERN "${THEME}/Main.qml" 
#            EXCLUDE PATTERN "${THEME}/metadata.desktop" 
#            EXCLUDE)
# =======
    install(DIRECTORY "${THEME}" DESTINATION "${DATA_INSTALL_DIR}/themes" PATTERN "${THEME}/*.ts"
            EXCLUDE PATTERN "${THEME}/Main.qml"
            EXCLUDE PATTERN "${THEME}/metadata.desktop"
            EXCLUDE PATTERN "${THEME}/.gitattributes"
            EXCLUDE)
# >>>>>>> pinkList
    install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/${THEME}" DESTINATION "${DATA_INSTALL_DIR}/themes")

    list(APPEND THEMES_QM_FILES ${QM_FILES})
endforeach(THEME)

add_custom_target(themes-translation DEPENDS ${THEMES_QM_FILES})
