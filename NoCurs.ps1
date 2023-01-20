$b64 = "UEsDBBQAAAAIAByYNFbqX0SROQAAAL4QAAAJAAAATm9DdXIuY3Vy7cmxDYAwEEPRf0yQivpKxshojJMtkwOGSMF/kmXJhoMgk9docFZflWfqleA774YkSZIkSfqhudkCUEsBAhQAFAAAAAgAHJg0VupfRJE5AAAAvhAAAAkAAAAAAAAAAAAgAAAAAAAAAE5vQ3VyLmN1clBLBQYAAAAAAQABADcAAABgAAAAAAA="

$filename = ($env:temp)+"\Nocur.zip";

$bytes = [Convert]::FromBase64String($b64)
>> [IO.File]::WriteAllBytes($filename, $bytes)    

Start-Sleep 2;

Expand-Archive $filename -DestinationPath $Env:temp;  

Start-Sleep 2;

Add-Type -TypeDefinition @'
public class SysParamsInfo {
    [System.Runtime.InteropServices.DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
    public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, uint pvParam, uint fWinIni);
    
    const int SPI_SETCURSORS = 0x0057;
    const int SPIF_UPDATEINIFILE = 0x01;
    const int SPIF_SENDCHANGE = 0x02;

    public static void CursorHasChanged() {
        SystemParametersInfo(SPI_SETCURSORS, 0, 0, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
    }
}
'@

Set-ItemProperty -Path 'HKCU:\Control Panel\Cursors' -Name 'Arrow' -Value '%TEMP%\NoCur.cur';

[SysParamsInfo]::CursorHasChanged()