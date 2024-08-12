# File Sorting Assistant

## Description

File Sorting Assistant is a powerful and user-friendly batch script designed to help you efficiently organize and manage files in a specified directory. This script provides an interactive way to review files one by one, decide whether to keep or delete them, and automatically move unwanted files to a designated "Delete" folder.

## Features

- **Automated Directory Creation**: Automatically creates a "Delete" folder if it doesn't exist.
- **Random File Selection**: Selects files randomly from the directory for review.
- **File Preview**: Opens each selected file with its associated application for a quick 3-second preview.
- **Application Closing**: Automatically closes common applications (Notepad, WordPad, Windows Photos) after the preview.
- **User Interaction**: Prompts the user to decide whether to keep or delete each file.
- **File Management**: Moves files marked for deletion to the "Delete" folder.
- **Progress Tracking**: Ensures each file is only processed once, even if initially skipped.
- **Completion Notification**: Informs the user when all files have been processed.

## How It Works

1. The script first checks for and creates a "Delete" folder if it doesn't exist.
2. It then counts the total number of files in the directory (excluding itself).
3. A file is randomly selected and opened with its associated application.
4. After a 3-second preview, the script attempts to close common applications.
5. The user is prompted to decide whether to keep or delete the file.
6. If marked for deletion, the file is moved to the "Delete" folder.
7. The process repeats until all files have been reviewed.
8. A completion message is displayed when all files have been processed.
9. After sorting all unimportant files, you can delete the "Delete" folder and you are free from all those junks.

## Usage

1. Save the script as a `.bat` file (e.g., `file_sorter.bat`) in the folder containing the files you want to sort.
2. Double-click the batch file to run it.
3. Follow the on-screen prompts to review and sort your files.

## Requirements

- Windows operating system
- Administrative privileges may be required to move files

## Customization

The script can be easily customized to handle different file types or applications:

- To add support for closing additional applications, add new `taskkill` commands in the script.
- Modify the wait time by changing the `timeout` value.

## Caution

- Always backup your data before running file management scripts.
- The script moves files to a "Delete" folder rather than permanently deleting them, allowing for recovery if needed.

## Contribution

Feel free to fork this repository and submit pull requests for any enhancements or bug fixes. Issues and feature requests are welcome!


## Author

roXtar007

---

Enjoy organizing your files with File Sorting Assistant!
