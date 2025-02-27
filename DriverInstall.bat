@echo off
rem *****************************************************
rem * �h���C�o�C���X�g�[��
rem *****************************************************

rem --------------------------------------------------
rem * �ϐ�
rem --------------------------------------------------

rem FileRepository�̃p�X
set REPO=Y:\FileRepository

rem ���O�t�@�C���̃p�X
set LOG=Y:\FileRepository\%~n0.log


echo �C�ӂ̃L�[�ŊJ�n
pause >nul
rem --------------------------------------------------
echo [%DATE% %TIME%]�ySTART�z%~n0.bat >> %LOG%
rem --------------------------------------------------

rem FileRepository���̑S�t�@�C�����擾
dir /s /b %REPO% > %REPO%\FileList.txt

rem INF�t�@�C���̂ݒ��o
findstr .inf$ %REPO%\FileList.txt > %REPO%\InfList.txt

rem �h���C�o�C���X�g�[��
for /f %%a in ( %REPO%\InfList.txt ) do (
	call :DriverInstall %%a
)

rem �����t�@�C���̍폜
del %REPO%\FileList.txt
del %REPO%\InfList.txt

rem --------------------------------------------------
echo [%DATE% %TIME%]�yFINISH�z%~n0.bat >> %LOG%
rem --------------------------------------------------
echo �C�ӂ̃L�[�ŏI��
exit /b


rem --------------------------------------------------
:DriverInstall
rem --------------------------------------------------
set INF=%~1

rem --------------------------------------------------
echo [%DATE% %TIME%]%INF%���C���X�g�[�����Ă��܂� >> %LOG%
rem --------------------------------------------------
pnputil /add-driver %INF% /install

if %ERRORLEVEL% equ 0 (
rem --------------------------------------------------
	echo [%DATE% %TIME%]%INF%��ǉ����܂��� >> %LOG%
rem --------------------------------------------------
) else (
rem --------------------------------------------------
	echo [%DATE% %TIME%]�yERROR�z%INF%��ǉ��ł��܂���ł��� >> %LOG%
rem --------------------------------------------------
)

exit /b

