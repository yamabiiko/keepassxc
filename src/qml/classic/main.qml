import QtQuick 2.7
import QtQuick.Controls 2.7
import QtQuick.Layouts 1.7

ApplicationWindow {
    title: "KeePassXC"
    width: 900
    height: 600
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&Database")
            MenuItem { action: actionDatabaseNew; hoverEnabled: true }
            MenuItem { action: actionDatabaseOpen; hoverEnabled: true }
            Menu {
                title: qsTr("&Recent databases")
            }
            MenuItem { action: actionDatabaseSave; hoverEnabled: true }
            MenuItem { action: actionDatabaseSaveAs; hoverEnabled: true }
            MenuItem { action: actionDatabaseClose; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionChangeMasterKey; hoverEnabled: true }
            MenuItem { action: actionChangeDatabaseSettings; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionDatabaseMerge; hoverEnabled: true }
            Menu {
                title: qsTr("&Import")
                MenuItem { action: actionImportKeePass1; hoverEnabled: true }
                MenuItem { action: actionImportOpVault; hoverEnabled: true }
                MenuItem { action: actionImportCsv; hoverEnabled: true }
            }
            Menu {
                title: qsTr("&Export")
                enabled: false
                MenuItem { action: actionExportCsv; hoverEnabled: true }
                MenuItem { action: actionExportHtml; hoverEnabled: true }
            }
            MenuItem { action: actionQuit }
        }

        Menu {
            title: qsTr("E&ntries")
            MenuItem { action: actionEntryNew; hoverEnabled: true }
            MenuItem { action: actionEntryEdit; hoverEnabled: true }
            MenuItem { action: actionEntryClone; hoverEnabled: true }
            MenuItem { action: actionEntryDelete; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionEntryCopyUsername; hoverEnabled: true }
            MenuItem { action: actionEntryCopyPassword; hoverEnabled: true }
            Menu {
                title: qsTr("Copy att&ribute")
                MenuItem { action: actionEntryCopyTitle; hoverEnabled: true }
                MenuItem { action: actionEntryCopyUrl; hoverEnabled: true }
                MenuItem { action: actionEntryCopyNotes; hoverEnabled: true }
            }
            Menu {
                title: qsTr("TOTP")
                MenuItem { action: actionEntryCopyTotp; hoverEnabled: true }
                MenuItem { action: actionEntryTotp; hoverEnabled: true }
                MenuItem { action: actionEntryTotpQRCode; hoverEnabled: true }
                MenuItem { action: actionEntrySetupTotp; hoverEnabled: true }
            }
            MenuSeparator { }
            MenuItem { action: actionEntryAutoType; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionEntryOpenUrl; hoverEnabled: true }
            MenuItem { action: actionEntryDownloadIcon; hoverEnabled: true }

        }

        Menu {
            title: qsTr("&Groups")
            MenuItem { action: actionGroupNew; hoverEnabled: true }
            MenuItem { action: actionGroupEdit; hoverEnabled: true }
            MenuItem { action: actionGroupDelete; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionGroupDownloadFavicons; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionGroupSortAsc; hoverEnabled: true }
            MenuItem { action: actionGroupSortDesc; hoverEnabled: true }
        }

        Menu {
            title: qsTr("&Tools")
            MenuItem { action: actionLockDatabases; hoverEnabled: true }
            MenuItem { action: actionPasswordGenerator; hoverEnabled: true }
            MenuItem { action: actionSettings; hoverEnabled: true }
        }

        Menu {
            title: qsTr("&Help")
            MenuItem { action: actionGettingStarted; hoverEnabled: true }
            MenuItem { action: actionUserGuide; hoverEnabled: true }
            MenuItem { action: actionKeyboardShortcuts; hoverEnabled: true }
            MenuItem { action: actionOnlineHelp; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionCheckForUpdates; hoverEnabled: true }
            MenuItem { action: actionDonate; hoverEnabled: true }
            MenuItem { action: actionBugReport; hoverEnabled: true }
            MenuSeparator { }
            MenuItem { action: actionAbout; hoverEnabled: true }
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton { action: actionDatabaseNew; display: AbstractButton.IconOnly }
            ToolButton { action: actionDatabaseOpen; display: AbstractButton.IconOnly }
            ToolButton { action: actionDatabaseSave; display: AbstractButton.IconOnly }
            ToolSeparator { }
            ToolButton { action: actionEntryNew; display: AbstractButton.IconOnly }
            ToolButton { action: actionEntryEdit; display: AbstractButton.IconOnly }
            ToolButton { action: actionEntryDelete; display: AbstractButton.IconOnly }
            ToolSeparator { }
            ToolButton { action: actionEntryCopyUsername; display: AbstractButton.IconOnly }
            ToolButton { action: actionEntryCopyPassword; display: AbstractButton.IconOnly }
            ToolButton { action: actionEntryCopyUrl; display: AbstractButton.IconOnly }
            ToolButton { action: actionEntryAutoType; display: AbstractButton.IconOnly }
            ToolSeparator { }
            ToolButton { action: actionPasswordGenerator; display: AbstractButton.IconOnly }
            ToolButton { action: actionLockDatabases; display: AbstractButton.IconOnly }
            ToolButton { action: actionSettings; display: AbstractButton.IconOnly }
            ToolSeparator { }
            Item { Layout.fillWidth: true }
            TextField {
                placeholderText: qsTr("Search (Ctrl+F)")
                Layout.preferredWidth: 300
                leftPadding: 36
                ToolButton { action: actionSearch; display: AbstractButton.IconOnly }
            }
        }
    }

    TabBar {
        width: parent.width
        TabButton {
            text: "Database.kdbx"
        }
    }

    // Database menu actions
    Action {
        id: actionDatabaseNew
        text: qsTr("&New Database...")
        shortcut: "Ctrl+Shift+N"
        icon.name: "document-new"
        icon.source: "qrc:/icons/document-new"
    }
    Action {
        id: actionDatabaseOpen
        text: qsTr("&Open Database...")
        shortcut: StandardKey.Open
        icon.name: "document-open"
        icon.source: "qrc:/icons/document-open"
    }
    Action {
        id: actionDatabaseSave
        text: qsTr("&Save Database")
        shortcut: StandardKey.Save
        icon.name: "document-save"
        icon.source: "qrc:/icons/document-save"
    }
    Action {
        id: actionDatabaseSaveAs
        text: qsTr("Sa&ve Database As...")
        shortcut: StandardKey.SaveAs
        icon.name: "document-save-as"
        icon.source: "qrc:/icons/document-new"
    }
    Action {
        id: actionDatabaseClose
        text: qsTr("&Close Database")
        shortcut: StandardKey.Close
        icon.name: "document-close"
        icon.source: "qrc:/icons/document-close"
    }
    Action {
        id: actionChangeMasterKey
        text: qsTr("Change Master &Key...")
        icon.name: "database-change-key"
        icon.source: "qrc:/icons/database-change-key"
    }
    Action {
        id: actionChangeDatabaseSettings
        text: qsTr("&Database Settings...")
        icon.name: "document-edit"
        icon.source: "qrc:/icons/document-edit"
    }
    Action {
        id: actionDatabaseMerge
        text: qsTr("&Merge From Database...")
        icon.name: "document-edit"
        icon.source: "qrc:/icons/document-edit"
    }
    Action {
        id: actionImportKeePass1
        text: qsTr("KeePass 1 Database...")
    }
    Action {
        id: actionImportOpVault
        text: qsTr("1Password OpVault...")
    }
    Action {
        id: actionImportCsv
        text: qsTr("CSV...")
    }
    Action {
        id: actionExportCsv
        text: qsTr("Export to CSV File...")
    }
    Action {
        id: actionExportHtml
        text: qsTr("Export to HTML File...")
    }
    Action {
        id: actionQuit
        text: qsTr("&Quit")
        shortcut: StandardKey.Quit
        icon.name: "application-exit"
        icon.source: "qrc:/icons/application-exit"
    }

    // Edit menu actions
    Action {
        id: actionEntryNew
        text: qsTr("&New Entry...")
        shortcut: StandardKey.New
        icon.name: "entry-new"
        icon.source: "qrc:/icons/entry-new"
    }
    Action {
        id: actionEntryEdit
        text: qsTr("&Edit Entry...")
        shortcut: "Ctrl+E"
        icon.name: "entry-edit"
        icon.source: "qrc:/icons/entry-edit"
    }
    Action {
        id: actionEntryClone
        text: qsTr("&Clone Entry...")
        shortcut: "Ctrl+K"
        icon.name: "entry-clone"
        icon.source: "qrc:/icons/entry-clone"
    }
    Action {
        id: actionEntryDelete
        text: qsTr("&Delete Entry...")
        shortcut: StandardKey.Delete
        icon.name: "entry-delete"
        icon.source: "qrc:/icons/entry-delete"
    }
    Action {
        id: actionEntryCopyUsername
        text: qsTr("Copy &Username")
        shortcut: "Ctrl+B"
        icon.name: "username-copy"
        icon.source: "qrc:/icons/username-copy"
    }
    Action {
        id: actionEntryCopyPassword
        text: qsTr("Copy &Password")
        shortcut: StandardKey.Copy
        icon.name: "password-copy"
        icon.source: "qrc:/icons/password-copy"
    }
    Action {
        id: actionEntryCopyTitle
        text: qsTr("&Title")
    }
    Action {
        id: actionEntryCopyUrl
        text: qsTr("&URL")
        shortcut: "Ctr+U"
        icon.name: "url-copy"
        icon.source: "qrc:/icons/url-copy"
    }
    Action {
        id: actionEntryCopyNotes
        text: qsTr("&Notes")
    }
    Action {
        id: actionEntryCopyTotp
        text: qsTr("Copy &TOTP")
        shortcut: "Ctrl+T"
    }
    Action {
        id: actionEntryTotp
        text: qsTr("Show TOTP...")
        shortcut: "Ctrl+Shift+T"
    }
    Action {
        id: actionEntryTotpQRCode
        text: qsTr("Show TOTP QR Code...")
    }
    Action {
        id: actionEntrySetupTotp
        text: qsTr("Set up TOTP...")
    }
    Action {
        id: actionEntryAutoType
        text: qsTr("Perform &Auto-Type")
        shortcut: "Ctrl+Shift+V"
        icon.name: "auto-type"
        icon.source: "qrc:/icons/auto-type"
    }
    Action {
        id: actionEntryOpenUrl
        text: qsTr("Open &URL")
        shortcut: "Ctrl+Shift+U"
    }
    Action {
        id: actionEntryDownloadIcon
        text: qsTr("Download Favicon")
        shortcut: "Ctrl+Shift+D"
        icon.name: "favicon-download"
        icon.source: "qrc:/icons/favicon-download"
    }

    // Groups menu actions
    Action {
        id: actionGroupNew
        text: qsTr("&New Group...")
        icon.name: "group-new"
        icon.source: "qrc:/icons/group-new"
    }
    Action {
        id: actionGroupEdit
        text: qsTr("&Edit Group...")
        icon.name: "group-edit"
        icon.source: "qrc:/icons/group-edit"
    }
    Action {
        id: actionGroupDelete
        text: qsTr("&Delete Group...")
        icon.name: "group-delete"
        icon.source: "qrc:/icons/group-delete"
    }
    Action {
        id: actionGroupDownloadFavicons
        text: qsTr("Downlo&ad All Favicons...")
        icon.name: "favicon-download"
        icon.source: "qrc:/icons/favicon-download"
    }
    Action {
        id: actionGroupSortAsc
        text: qsTr("Sort &A-Z")
    }
    Action {
        id: actionGroupSortDesc
        text: qsTr("Sort &Z-A")
    }

    // Tools menu actions
    Action {
        id: actionLockDatabases
        text: qsTr("&Lock Databases")
        shortcut: "Ctrl+L"
        icon.name: "database-lock"
        icon.source: "qrc:/icons/database-lock"
    }
    Action {
        id: actionPasswordGenerator
        text: qsTr("&Password Generator...")
        icon.name: "password-generator"
        icon.source: "qrc:/icons/password-generator"
        checkable: true
    }
    Action {
        id: actionSettings
        text: qsTr("&Settings...")
        icon.name: "configure"
        icon.source: "qrc:/icons/configure"
        checkable: true
    }

    // Help menu actions
    Action {
        id: actionGettingStarted
        text: qsTr("&Getting Started...")
    }
    Action {
        id: actionUserGuide
        text: qsTr("&User Guide...")
    }
    Action {
        id: actionKeyboardShortcuts
        text: qsTr("&Keyboard Shortcuts...")
        shortcut: "Ctrl+/"
    }
    Action {
        id: actionOnlineHelp
        text: qsTr("&Online Help...")
    }
    Action {
        id: actionCheckForUpdates
        text: qsTr("&Check for Updates...")
        icon.name: "system-software-update"
        icon.source: "qrc:/icons/system-software-update"
    }
    Action {
        id: actionDonate
        text: qsTr("&Donate...")
    }
    Action {
        id: actionBugReport
        text: qsTr("&Report a Bug...")
    }
    Action {
        id: actionAbout
        text: qsTr("&About KeePassXC...")
        icon.name: "help-about"
        icon.source: "qrc:/icons/help-about"
    }

    // Search action
    Action {
        id: actionSearch
        icon.name: "system-search"
        icon.source: "qrc:/icons/system-search"
    }
}
