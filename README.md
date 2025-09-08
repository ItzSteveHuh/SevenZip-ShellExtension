# 7-Zip Shell Extension

A modern Windows Explorer context menu integration for 7-Zip archive operations. This project is based on the NanaZip shell extension but adapted to work with the standard 7-Zip installation.

## Overview

This shell extension provides modern Windows Explorer context menu integration for 7-Zip archive operations. It's based on the NanaZip shell extension but adapted to work with the standard 7-Zip installation.

## Features

- **Context Menu Integration**: Right-click context menu in Windows Explorer
- **Archive Operations**: Extract, Compress, Test archives
- **Multiple Formats**: Supports 7z, zip, rar, bz2, gz, lz4, lz5, zst, and more
- **Email Integration**: Compress and email files directly
- **Hash Calculation**: CRC32, CRC64, SHA1, SHA256 checksums
- **Modern UI**: Uses Windows 10/11 modern shell APIs

## Changes from NanaZip Version

1. **Executable Path**: Changed from `NanaZip.Modern.FileManager.exe` to `7zFM.exe` (7-Zip File Manager)
2. **Installation Detection**: Automatically finds 7-Zip installation in common locations
3. **Branding**: Updated to use "7-Zip" branding instead of "NanaZip"
4. **GUID**: New unique GUID for proper Windows registration
5. **Removed Features**: Removed NanaZip-specific "Smart Extract" functionality

## Installation

### Prerequisites
- Windows 10/11
- Visual Studio 2019 or later with C++/WinRT support
- 7-Zip installed on the system

### Building
1. Open `SevenZip.ShellExtension.vcxproj` in Visual Studio
2. Build the project (Release configuration recommended)
3. The output will be `SevenZip.ShellExtension.dll`

### Registration
1. Run Command Prompt as Administrator
2. Navigate to the directory containing `SevenZip.ShellExtension.dll`
3. Run: `regsvr32 SevenZip.ShellExtension.dll`

### Unregistration
To remove the shell extension:
1. Run Command Prompt as Administrator
2. Navigate to the directory containing `SevenZip.ShellExtension.dll`
3. Run: `regsvr32 /u SevenZip.ShellExtension.dll`

## Usage

After installation and registration, you'll see a "7-Zip" option in the context menu when right-clicking on:
- Archive files (.7z, .zip, .rar, etc.)
- Regular files and folders (for compression)
- Multiple selected items

### Available Operations

**For Archives:**
- Open with 7-Zip
- Extract Here
- Extract to [folder name]
- Test Archive
- Calculate Checksums (CRC32, CRC64, SHA1, SHA256)

**For Files/Folders:**
- Add to Archive (with dialog)
- Add to [filename].7z
- Add to [filename].zip
- Compress and Email
- Compress to [filename].7z and Email
- Compress to [filename].zip and Email

## Technical Details

### Architecture
- **Language**: C++ with C++/WinRT
- **APIs**: Windows Shell API, IExplorerCommand interface
- **Dependencies**: SevenZip library code, Windows Shell libraries

### File Structure
```
SevenZip-ShellExtension/
├── SevenZip.ShellExtension.cpp    # Main implementation
├── SevenZip.ShellExtension.def    # DLL exports
├── SevenZip.ShellExtension.manifest # Assembly manifest
├── SevenZip.ShellExtension.vcxproj # Visual Studio project
├── SevenZip.ShellExtension.vcxproj.filters # Project filters
├── SevenZip.ShellExtension.sln    # Visual Studio solution
├── SevenZip/                      # SevenZip library code
├── register.bat                   # Registration script
├── unregister.bat                 # Unregistration script
└── README.md                      # This file
```

### Key Components
- **ExplorerCommandRoot**: Main command provider
- **ExplorerCommandBase**: Individual command implementation
- **ClassFactory**: COM class factory for registration

## Troubleshooting

### Common Issues

1. **Context menu not appearing**
   - Ensure the DLL is properly registered
   - Check that 7-Zip is installed
   - Restart Windows Explorer

2. **"7-Zip not found" errors**
   - Verify 7-Zip is installed in Program Files
   - Check that 7zFM.exe exists in the 7-Zip directory

3. **Build errors**
   - Ensure C++/WinRT is installed
   - Check that all dependencies are available
   - Verify Windows SDK version compatibility

### Registry Information
The shell extension registers with GUID: `7A8B9C2D-4E5F-4A1B-8C3D-9E0F1A2B3C4D`

## License

This project is based on:
- **NanaZip**: MIT License
- **7-Zip**: LGPL License

Please ensure compliance with both licenses when using or distributing this code.

## Contributing

This is a fork created for 7-Zip compatibility. For the original NanaZip project, please visit the official NanaZip repository.

## Support

This is an unofficial fork. For issues:
1. Check that 7-Zip is properly installed
2. Verify Windows compatibility
3. Ensure proper registration of the shell extension

---

**Note**: This shell extension is not officially affiliated with 7-Zip or NanaZip. It's a community modification for enhanced Windows integration.
