@echo off
rem *****************************************************
rem * ドライバインストール
rem *****************************************************

rem --------------------------------------------------
rem * 変数
rem --------------------------------------------------

rem FileRepositoryのパス
set REPO=Y:\FileRepository

rem ログファイルのパス
set LOG=Y:\FileRepository\%~n0.log


echo 任意のキーで開始
pause >nul
rem --------------------------------------------------
echo %DATE% %TIME%	【START】%~n0.bat >> %LOG%
rem --------------------------------------------------

rem FileRepository内の全ファイルを取得
dir /s /b %REPO% > %REPO%\FileList.txt

rem INFファイルのみ抽出
findstr .inf$ %REPO%\FileList.txt > %REPO%\InfList.txt

rem ドライバインストール
for /f %%a in ( %REPO%\InfList.txt ) do (
	call :DriverInstall %%a
)

rem いらんファイルの削除
del %REPO%\FileList.txt
del %REPO%\InfList.txt

rem --------------------------------------------------
echo %DATE% %TIME%	【FINISH】%~n0.bat >> %LOG%
rem --------------------------------------------------
echo 任意のキーで終了
pause >nul


rem --------------------------------------------------
:DriverInstall
rem --------------------------------------------------
set INF=%~1

rem ドライバーインストール
pnputil /add-driver %INF% /install

if %ERRORLEVEL% neq 0 (
	echo エラー:	%INF%を追加できませんでした >> %LOG%
)

exit /b

