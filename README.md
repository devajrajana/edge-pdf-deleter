# Edge Local File Deleter (`delurl`)

A lightweight, native Windows power-user workflow to instantly delete a locally opened file (like a PDF) directly from Microsoft Edge and send it to the Recycle Bin—without ever opening File Explorer.

No third-party software or background agents required. Uses native Windows Batch, PowerShell, and VBScript hooks.

## ⚡ The 1-Second Workflow

1. In Edge: Press **Ctrl + L** then **Ctrl + C** (Copies the file URL).
2. Press your custom global hotkey (e.g., **Ctrl + Alt + X**).
3. *Poof.* The file is in the Recycle Bin.

---

## 🛠️ How It Works Under the Hood

When you copy a local file URL from Edge, it looks like this: `file:///C:/Users/Name/Downloads/My%20File.pdf`. 

Windows cannot natively delete that string because of the `file:///` prefix and the `%20` space encodings. This script automates the cleanup:
* It grabs the URL directly from your clipboard.
* It casts the string as a native `[uri]` object in PowerShell, which automatically handles all URL decoding and converts it into a standard local absolute path.
* It invokes the Visual Basic `FileSystem` shell to safely move the target file to the Windows Recycle Bin rather than permanently deleting it (`Shift + Del`).

---

## 🚀 Setup Instructions

### Step 1: Save the Script
1. Create a folder on your PC for custom scripts if you don't have one (e.g., `C:\Scripts`).
2. Download `delurl.bat` from this repository and place it in that folder.

### Step 2: Create the Global Hotkey
Windows allows you to assign global keyboard shortcuts to desktop shortcuts.
1. Right-click `delurl.bat` and select **Create shortcut**.
2. Move that newly created shortcut onto your **Desktop** (Windows requires hotkey shortcuts to live on the Desktop or Start Menu to trigger globally).
3. Right-click the desktop shortcut and select **Properties**.
4. Click into the **Shortcut key** field and press your preferred key combination (Recommended: `Ctrl + Alt + X`).
5. Change the **Run** dropdown menu from *Normal window* to **Minimized** (this prevents a black command prompt window from flashing on your screen).
6. Click **Apply** and **OK**.

---

## 📝 License
MIT License. Feel free to modify and use it however you like!
