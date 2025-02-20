@ECHO OFF
rem *****************************
rem * ドライバインストール
rem *****************************

rem ----------------------------
rem * 変数
rem ----------------------------

rem FileRepositoryのパス
SET REPO=Y:\FileRepository

echo キーを押して開始
pause >nul

rem FileRepository内の全ファイルを取得
dir /s /b %REPO% > %REPO%\FileList.txt

rem INFファイルのみ抽出
findstr .inf$ %REPO%\FileList.txt > %REPO%\InfList.txt

rem ドライバインストール
for /f %%a in ( %REPO%\InfList.txt ) do (
	pnputil /add-driver %%a /install
)

rem いらんファイルの削除
del %REPO%\FileList.txt
del %REPO%\InfList.txt

echo おわり
pause >nul

