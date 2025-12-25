# pdf2img-windows

A simple PowerShell tool to convert PDF pages to images using pdftoppm.

## Prerequisites

### 1. Download Poppler for Windows

- Visit [Poppler for Windows](https://github.com/oschwartz10612/poppler-windows/releases/) and download the latest release
- Extract to any location, e.g., `C:\Program Files\poppler`

### 2. Configure Environment Variables

Add the following paths to your system `PATH` environment variable:

1. Path to `pdftoppm.exe` (usually in `poppler-xx.xx.x\Library\bin\`)
2. Path to `pdf2img.ps1` script

**Configuration steps:**
- Right-click "This PC" → Properties → Advanced system settings → Environment Variables
- Find `Path` under "System variables" and click Edit
- Click "New" and add the above paths
- Click OK to save

## Usage

1. In Windows Explorer, **select and copy** the PDF file(s) you want to convert (multiple selection supported)
   - Press `Ctrl + C` after selecting files
2. Navigate to the folder where you want to save the converted images
3. Type `powershell` in the folder's address bar and press Enter
4. Run the command:
```powershell
   pdf2img.ps1
```
5. The script will automatically read PDF files from clipboard and start conversion
6. Converted images will be saved in the current folder

## Output

- Each PDF page will be converted to a separate PNG image
- Files are saved in the folder where the script is executed

## Requirements

- Windows 10/11
- PowerShell 5.1 or higher

## License

MIT