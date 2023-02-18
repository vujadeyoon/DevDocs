# Visual Studio Code


## Table of contents
1. [Notice](#notice)
2. [Usage](#usage)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Visual Studio Code
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Usage <a name="usage"></a>
### 1. How to open the Settings
```bash
Ctrl + ,
```

### 2. Useful extensions.
1. Markdown Preview Enhanced
2. Diff Folders

### 3. How to set live preview
1. Open the Settings and search the string, Auto Save.
2. Set the variables.
   1. Files: Auto Save: afterDelay
   2. Files: Auto Save Delay: 500
3. Duplicate the window
    ```bash
    F1 + Workspaces: Duplicate As workspace in New Window
    ```

### 4. How to edit font ligatures
1. Open the settings.json for the font ligatures.
   1. Open the Settings.
   2. Search the settings.
   3. Click the button, Edit in the settings.json in the section, Editor: Font Ligatrues.
2. Replace the json file.
```json
{
    "workbench.colorTheme": "Quiet Light",
    "python.defaultInterpreterPath": "/usr/bin/python3",
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 500,
    "[json]": {
        "editor.quickSuggestions": {
            "strings": true
        },
        "editor.suggest.insertMode": "replace"
    },

    // Custom
    // Minimap
    "editor.minimap.enabled": false,
    // Color
    "workbench.colorCustomizations": {
        // Totally Transparent
        "editor.findMatchHighlightBackground": "#ffff0050",
        // Borders
        "editor.selectionHighlightBorder": "#ff0000",
        "editor.lineHighlightBorder": "#00000020",
        // Selection
        "editor.findMatchBackground": "#ffff00",
        "editor.findMatchBorder": "#ff0000",
        // Misc
        "editorCursor.foreground": "#000000",
        "editor.lineHighlightBackground": "#E3F5D3",

    },
    "window.zoomLevel": -1,
    "editor.fontLigatures": null
}
```


## 3. Reference <a name="ref"></a>
