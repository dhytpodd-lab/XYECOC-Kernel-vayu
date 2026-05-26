@echo off
setlocal
set ZIPNAME=XYECOC_Kernel_KSUN_PocoX3Pro_vayu_bhima.zip
if not exist anykernel.sh (
  echo Run this bat from the extracted AnyKernel3 package folder.
  exit /b 1
)
if not exist Image.gz-dtb if not exist Image.gz if not exist Image (
  echo ERROR: Add Image.gz-dtb / Image.gz / Image to this folder first.
  exit /b 1
)
if exist "%ZIPNAME%" del "%ZIPNAME%"
"C:\Program Files\7-Zip\7z.exe" a -tzip -mx=0 "%ZIPNAME%" * -xr!*.zip
if errorlevel 1 (
  echo 7-Zip failed. Check path to 7z.exe.
  exit /b 1
)
echo Done: %ZIPNAME%
endlocal
