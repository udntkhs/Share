@ECHO OFF
rem *****************************
rem * �h���C�o�C���X�g�[��
rem *****************************

rem ----------------------------
rem * �ϐ�
rem ----------------------------

rem FileRepository�̃p�X
SET REPO=Y:\FileRepository

echo �L�[�������ĊJ�n
pause >nul

rem FileRepository���̑S�t�@�C�����擾
dir /s /b %REPO% > %REPO%\FileList.txt

rem INF�t�@�C���̂ݒ��o
findstr .inf$ %REPO%\FileList.txt > %REPO%\InfList.txt

rem �h���C�o�C���X�g�[��
for /f %%a in ( %REPO%\InfList.txt ) do (
	pnputil /add-driver %%a /install
)

rem �����t�@�C���̍폜
del %REPO%\FileList.txt
del %REPO%\InfList.txt

echo �����
pause >nul

