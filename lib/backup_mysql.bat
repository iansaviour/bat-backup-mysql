@echo off

set dbUser=root
set dbPassword=pass
set "mydump=%~dp0mysqldump.exe"
set "zip=%~dp07-Zip\7z.exe"

For /f %%G in ('cscript /nologo getdate.vbs') do set _dtm=%%G
Set _yyyy=%_dtm:~0,4%
Set _mm=%_dtm:~4,2%
Set _dd=%_dtm:~6,2%
Set _hh=%_dtm:~8,2%
Set _nn=%_dtm:~10,2%

"%mydump%" --host="192.168.1.2" --user=%dbUser% --password=%dbPassword% --ignore-table=db_volcom_mrp.tb_soh --ignore-table=db_volcom_mrp.tb_soh_on_hand --ignore-table=db_volcom_mrp.tb_soh_periode --ignore-table=db_volcom_mrp.tb_soh_price --ignore-table=db_volcom_mrp.tb_soh_store --database db_volcom_mrp |7z.exe a -si"%_yyyy%-%_mm%-%_dd%_%time:~0,2%-%time:~3,2%-%time:~6,2%.sql" "%~dp0..\backup\%_yyyy%-%_mm%-%_dd%_%_hh%-%_nn%.7z"
